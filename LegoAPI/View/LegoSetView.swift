//
//  LegoSetView.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/21/24.
//

import SwiftUI

struct LegoSetView: View {
    @StateObject var viewModel = LegoSetVM()
    @StateObject var inventoryViewModel = InventoryLegoPartVM()
    
    @State private var isSearching = false
    
    var body: some View {
        NavigationStack {
            searchlegoSetView
            Section("Lego Set") {
                listOfSet
            }
        }
    }
    
    private var searchlegoSetView: some View {
        VStack {
            topHStack
            bottomHStack
        }
        .onSubmit {
            viewModel.searchLegoSetWithTheme()
            viewModel.searchLegoSetWithAThemeAndYear()
        }
    }
    
    private var listOfSet: some View {
        List {
            if let legoSet = viewModel.searchLegoSet {
                ForEach(legoSet, id: \.setNumber) { set in
                    listItem(for: set)
                }
            }
        }
        .onAppear {
            viewModel.getLegoSet()
        }
    }
    
    private var topHStack: some View {
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
    }
    
    private var bottomHStack: some View {
        HStack {
            Spacer()
            minimumpickerSelectionView
            Spacer(minLength: 40)
            maximumPickerSelectionView
            Spacer(minLength: 15)
        }
    }
    
    private var minimumpickerSelectionView: some View {
        Picker("Minimum", selection: $viewModel.minYear) {
            ForEach(1949...2025, id: \.self) { minimumYear in
                Text(minimumYear.formatted(.number))
            }
        }
        .padding()
        .frame(width: 150, height: 50)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .stroke(Color.gray)
                .shadow(color: .primary.opacity(0.15), radius: 10, x: 0, y: 0)
        )
    }
    
    private var maximumPickerSelectionView: some View {
        Picker("maximum", selection: $viewModel.maxYear) {
            ForEach(1949...2025, id: \.self) { maximumYear in
                Text(maximumYear.formatted(.number))
            }
        }
        .padding()
        .frame(width: 150, height: 50)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .stroke(Color.gray)
                .shadow(color: .primary.opacity(0.15), radius: 10, x: 0, y: 0)
        )
    }
    
    private func listItem(for set: LegoSet.SetResults) -> some View {
        NavigationLink {
            LegoSetDetailView(
                Legoset: set,
                letSetViewModel: viewModel,
                inventoryViewModel: inventoryViewModel
            )
        } label: {
            LegoSetPreviewView(name: set.name ?? "No name", setNumber: set.setNumber ?? "No SetNumber", setImageURL: set.setImageURL, themeId: set.themeID ?? 0, year: set.year ?? 0000)
        }
    }
}

struct LegoSetPreviewView: View {
    let name: String
    let setNumber: String
    let setImageURL: String?
    
    let themeId: Int
    let year: Int
    
    var body: some View {
        details
    }
    
    private var details: some View {
        HStack(alignment: .top, spacing: 12) {
            displayImageUrl
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline.bold())
                Text("set number: -\(setNumber)")
                    .font(.subheadline)
                Text("It came out in \(year.formatted(.number))")
                    .font(.subheadline)
                Text(themeId.formatted(.number))
            }
        }
    }
    
    private var displayImageUrl: some View {
        AsyncImage(url: URL(string: setImageURL ?? "Unknown")) { phase in
            switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                default:
                    Image("yellowMinifiger")
                        .resizable()
            }
        }
        .frame(width: 150 ,height: 150)
    }
}

#Preview {
    LegoSetView()
}

