//
//  MinifigSrceen.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/13/24.
//

import SwiftUI

struct MinifigSrceen: View {
    
    @StateObject private var viewModel = LegoMinifigSearchVM()
    @StateObject private var setViewModel = MinifigInSetCameInVM()
    @StateObject private var partViewModel = PartsVM()
    @State private var isSearching = false

    var body: some View {
        NavigationStack {
            searchMinifigure
            Section("Minifigure") {
                listOfMinifig
            }
        }
    }
    
    private var searchMinifigure: some View {
        HStack(spacing: 1) {
            MinifigureSearchBar(searchText: $viewModel.searchText)
            Picker("Select Theme", selection: $viewModel.themeId) {
                ForEach(LegoThemes.allCases, id: \.id) { theme in
                    Text(theme.displayName)
                        .tag(theme.rawValue)
                        .lineLimit(1)
                        .tint(Color.black)
                }
            }
            .padding()
            .frame(width: 170, height: 50)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .stroke(Color.gray)
                    .shadow(color: .primary.opacity(0.15), radius: 10, x: 0, y: 0)
            )
            Spacer(minLength: 15)
        }
        .onSubmit {
            viewModel.searchMinifigWithThemeId()
        }
    }
    
    private var listOfMinifig: some View {
        ScrollView {
            if let minifig = viewModel.searchLegoMinifig {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 300), spacing: 1)]) {
                    ForEach(minifig, id: \.name) { minifiger in
                        listItem(for: minifiger)
                            .frame(width: 160, height: 200)
                            .background(
                                Rectangle()
                                    .stroke(Color.gray))
                    }
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.getMinifiger()
        }
    }
    
    private func listItem(for minifiger: Lego.LegoResults) -> some View {
        NavigationLink {
            MinifigerDetailView(
                lego: minifiger,
                minifigesInetViewModel: setViewModel,
                partViewModel: partViewModel
            )
        } label: {
            MinifigerPreviewView(
                name: minifiger.name ?? "no name",
                setNum: minifiger.setNum ?? "no set number", numberOfpart: minifiger.numberOfPart ?? 0,
                seturl: URL(string: minifiger.setImageURL ?? "Unknown")
            )
        }
    }
}

#Preview {
    MinifigSrceen()
}
