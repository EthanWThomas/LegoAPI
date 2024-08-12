//
//  ColorAndLegoPartVM.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/8/24.
//

import Foundation

class ColorAndLegoPartVM: ObservableObject {
    
    @Published private var colorAndSetPartResults = [PartsAndColor.PartsAndColorResults]()
    
    @Published private(set) var isLoading = true
    @Published private(set) var errorMessage: String?
    
    @Published var partNumber = ""
    
    private let apiManager = RebrickableAPI()
    
    var searchLegoPartWithColor: [PartsAndColor.PartsAndColorResults] { getsearchResult() }
    
    func searchPartNumber() {
        isLoading = true
        
        Task { [weak self] in
            do {
                guard let partAndColorNumber =
                        self?.partNumber
                else { return }
                
                let results = try await
                self?.apiManager.getListOfAllColorAndPart(partNum: partAndColorNumber)
                self?.isLoading = false
                
                await MainActor.run { [weak self] in
                    self?.colorAndSetPartResults = results!
                }
            } catch {
                print("No Result Found \(error)")
                self?.errorMessage = error.localizedDescription
                self?.isLoading = false
            }
        }
    }
    
    func getsearchResult() -> [PartsAndColor.PartsAndColorResults] {
        if partNumber.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return colorAndSetPartResults
        } else {
            return colorAndSetPartResults.filter { result in
                result.partImageUrL.range(of: partNumber, options: .caseInsensitive) != nil
            }
        }
    }
}
