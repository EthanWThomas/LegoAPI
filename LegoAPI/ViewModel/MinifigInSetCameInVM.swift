//
//  MinifigInSetCameInVM.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/8/24.
//

import Foundation

class MinifigInSetCameInVM: ObservableObject {
     
    @Published private(set) var isLoading = true
    @Published private(set) var errorMessage: String?
    
    @Published var setNumber = ""
    @Published var minifigInSetResult = [Lego.LegoResults]()
    
    private let apiManager = RebrickableAPI()
    
    var searchLegoMinifigInSet: [Lego.LegoResults] { getsearchResult() }
    
    func searchIdforMinifiger() {
        isLoading = true
        
        Task { [weak self] in
            do {
                guard let minifigSetNumber = self?.setNumber
                else { return }
                
                let results = try await self?.apiManager.getAllMinifigsSetCameIn(setNumber: minifigSetNumber)
                self?.isLoading = false
                
                await MainActor.run { [weak self] in
                    self?.minifigInSetResult = results!
                }
            } catch {
                print("No Result Found \(error)")
                self?.errorMessage = error.localizedDescription
                self?.isLoading = false
            }
        }
    }
    
    func getsearchResult() -> [Lego.LegoResults] {
        if setNumber.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return minifigInSetResult
        } else {
            return minifigInSetResult.filter { result in
                result.setNum?.range(of: setNumber, options: .caseInsensitive) != nil
            }
        }
    }
}
