//
//  SearchLegoVM.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/8/24.
//

import Foundation

class LegoMinifigSearchVM: ObservableObject {
    
    @Published private(set) var isLoading = true
    @Published private(set) var errorMessage: String?
    
    @Published var searchText = ""
    @Published var minifigeResult: Lego.LegoResults?
    @Published var minifige: [Lego.LegoResults]?
    
    private let apiManager = RebrickableAPI()
    
    var searchLegoMinifig: Lego.LegoResults { getsearchResult() }
    
    func searchMinifig() {
        isLoading = true
        
        Task { [weak self] in
            do {
                guard let searchText = self?.searchText
                else { return }
                
                let results = try await self?.apiManager.searchMinfigs(with: searchText)
                self?.isLoading = false
                
                await MainActor.run { [weak self] in
                    self?.minifigeResult = results
                }
            } catch {
                print("No Result Found \(error)")
                self?.errorMessage = error.localizedDescription
                self?.isLoading = false
            }
        }
    }
    
    @MainActor
    func getMinifiger() {
        isLoading = true
        
        Task {
            do {
                self.minifige = try await apiManager.getMinifig().results
                self.isLoading = false
            } catch {
                print(error)
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
        }
    }
    
    func getsearchResult() -> Lego.LegoResults {
        if searchText.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return minifigeResult!
        } else {
            // TODO: fix it
            return minifigeResult!
        }
    }
}
