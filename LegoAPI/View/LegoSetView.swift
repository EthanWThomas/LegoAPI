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
    
    var body: some View {
        NavigationStack {
            VStack {
                SearchBarView(seacrhText: $viewModel.searchText)
                Section("Lego Set") {
                    listOfSet
                }
            }
            .onSubmit {
                viewModel.seacrhLegoSet()
            }
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
                Text("set number-\(setNumber)")
                    .font(.subheadline)
                Text("it came out in \(year.formatted(.number))")
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

