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
    @Published var themeId = ""
    
    @Published var minifigeResult = [Lego.LegoResults]()
    @Published var minifige: [Lego.LegoResults]?

    private let apiManager = RebrickableAPI()
    
    var searchLegoMinifig: [Lego.LegoResults]? { 
            get { return getsearchResult() }
        }
    
    @MainActor
    func searchMinifig() {
        isLoading = true
        
        Task { [weak self] in
            do {
                guard let searchText = self?.searchText
                else { return }
                
                let results = try await self?.apiManager.searchMinfigs(with: searchText).results
                self?.isLoading = false
                
                await MainActor.run { [weak self] in
                    self?.minifigeResult = results!
                }
            } catch {
                print("No Result Found \(error)")
                self?.errorMessage = error.localizedDescription
                self?.isLoading = false
            }
        }
    }
    
    @MainActor
    func searchMinifigWithThemeId() {
        isLoading = true
        
        Task { [weak self] in
            do {
                guard let searchText = self?.searchText
                else { return }
                
                guard let themeId = self?.themeId
                else { return }
                
                let results = try await self?.apiManager.searchMinifigureWithThemeId(theme: themeId, with: searchText).results
                self?.isLoading = false
                
                await MainActor.run { [weak self] in
                    self?.minifigeResult = results!
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
    
    func getsearchResult() -> [Lego.LegoResults]? {
        if searchText.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return minifigeResult
        } else {
            return minifigeResult.filter { result in
                result.name?.range(of: searchText, options: .caseInsensitive) != nil
            }
        }
    }
}
