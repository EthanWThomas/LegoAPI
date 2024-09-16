//
//  PartsVM.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/8/24.
//

import Foundation

class PartsVM: ObservableObject {
     
    @Published private(set) var isLoading = true
    @Published private(set) var errorMessage: String?
    
    @Published var searchText = ""
    @Published var setNumber = ""
    
    @Published var legoPartsResult = [AllParts.PartResults]()
    @Published var part: [AllParts.PartResults]?
    @Published var inventoryPart: [InventoryLegoParts.PartResult]?
    
    private let apiManager = RebrickableAPI()
    
    var searchLegoPart: [AllParts.PartResults]? {
        get { return getsearchResult() }
    }
    
    func searchLegoParts() {
        
        isLoading = true
        
        Task { [weak self] in
            do {
                guard let searchText = self?.searchText
                else { return }
                
                let results = try await self?.apiManager.searchParts(with: searchText).results
                self?.isLoading = false
                
                await MainActor.run { [weak self] in
                    self?.legoPartsResult = results!
                }
            } catch {
                print("No Result Found \(error)")
                self?.errorMessage = error.localizedDescription
                self?.isLoading = false
            }
        }
    }
    
    @MainActor
    func getPart() {
        isLoading = true
        Task {
            do {
                self.part = try await apiManager.getPart().results
                isLoading = false
            } catch {
                print(error)
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
        }
    }
    
    @MainActor
    func getminifigePart(figNumber: String) {
        isLoading = true
        
        Task {
            do {
                self.inventoryPart = try await apiManager.getMinifigerInvetory(setNum: figNumber).results
                self.isLoading = false
            } catch {
                print(error)
                errorMessage = error.localizedDescription
                self.isLoading = false
            }
        }
    }
    
    func getsearchResult() -> [AllParts.PartResults] {
        if searchText.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return legoPartsResult
        } else {
            return legoPartsResult.filter { result in
                result.name?.range(of: searchText, options: .caseInsensitive) != nil
            }
        }
    }
}
