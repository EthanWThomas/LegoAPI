//
//  InventoryLegoPartVM.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/9/24.
//

import Foundation

class InventoryLegoPartVM: ObservableObject {
    
    @Published private(set) var isLoading = true
    @Published private(set) var errorMessage: String?
    
    @Published var setNumber = ""
    @Published var inventoryPartResults = [InventoryLegoParts.PartResult]()
    
    private let apiManager = RebrickableAPI()
    
    var searchLegoSetInventory: [InventoryLegoParts.PartResult] { getsearchResult() }
    
    func searchPartNumber() {
        isLoading = true
        
        Task { [weak self] in
            do {
                guard let inventoryLegoPart = self?.setNumber
                else { return }
                
                let results = try await self?.apiManager.getInvetoryPartInASet(setNum: inventoryLegoPart)
                self?.isLoading = false
                
                await MainActor.run { [weak self] in
                    self?.inventoryPartResults = results!
                }
            } catch {
                print("No Result Found \(error)")
                self?.errorMessage = error.localizedDescription
                self?.isLoading = false
            }
        }
    }
    
    func getsearchResult() -> [InventoryLegoParts.PartResult] {
        if setNumber.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return inventoryPartResults
        } else {
            return inventoryPartResults.filter { result in
                result.part.partNumber.range(of: setNumber, options: .caseInsensitive) != nil
            }
        }
    }
}
