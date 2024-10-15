//
//  LegoPartView.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/22/24.
//

import SwiftUI

struct LegoPartView: View {
    @StateObject private var viewModel = PartsVM()
    @State private var selectedCategory = ""
    
    @State private var isSearching = false
    
    var body: some View {
        NavigationStack {
            partSelected
            Section("Part") {
                listOfPart
            }
        }
    }
    
    private var partSelected: some View {
        VStack {
            SearchBarView(searchText: $viewModel.searchText)
//            PartPickerVIew(selection: $viewModel.searchText)
        }
        .onSubmit {
            viewModel.searchLegoParts()
        }
    }
    
    private var listOfPart: some View {
        ScrollView {
            if let part = viewModel.searchLegoPart {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 300), spacing: 1)]) {
                    ForEach(part, id: \.partNumber) { legoPart in
                        listItem(
                            part: legoPart.partImageUrl,
                            part: legoPart.partNumber
                        )
                        .frame(width: 160, height: 200)
                        .background(
                            Rectangle()
                                .stroke(Color.gray)
                        )
                    }
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.getPart()
        }
    }
    
    private func listItem(part url: String?, part number: String?) -> some View {
        VStack {
            AsyncImage(url: URL(string: url ?? "Unknown")) { phase in
                switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    default:
                        Image("redBrick")
                            .resizable()
                }
            }
            .frame(width: 100 ,height: 100)
            HStack {
                Text(number ?? "No part number?")
                    .font(.headline)
                    .lineLimit(1)
                    .padding()
            }
        }
    }
}

#Preview {
    LegoPartView()
}

