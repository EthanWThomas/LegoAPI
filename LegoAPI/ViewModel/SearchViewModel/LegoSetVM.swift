//
//  LegoSetVM.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/8/24.
//

import Foundation

class LegoSetVM: ObservableObject {
    
    @Published private(set) var isLoading = true
    @Published private(set) var errorMessage: String?
    
    @Published var searchText = ""
    @Published var legoSetResults = [LegoSet.SetResults]()
    
    private let apiManager = RebrickableAPI()
    
    var searchLegoSet: [LegoSet.SetResults] { getsearchResult() }
    
    func seacrhLegoSet() {
        
        isLoading = true
        
        Task { [weak self] in
            do {
                guard let searchText = self?.searchText
                else { return }
                
                let results = try await self?.apiManager.getAllLegoSets(with: searchText)
                self?.isLoading = false
                
                await MainActor.run { [weak self] in
                    self?.legoSetResults = results!
                }
            } catch {
                print("No Result Found \(error)")
                self?.errorMessage = error.localizedDescription
                self?.isLoading = false
            }
        }
    }
    
    func getsearchResult() -> [LegoSet.SetResults] {
        if searchText.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return legoSetResults
        } else {
            return legoSetResults.filter { result in
                result.name.range(of: searchText, options: .caseInsensitive) != nil
            }
        }
    }
}
