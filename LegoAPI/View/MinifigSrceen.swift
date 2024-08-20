//
//  MinifigSrceen.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/13/24.
//

import SwiftUI

struct MinifigSrceen: View {
    
    @StateObject var viewModel = LegoMinifigSearchVM()
    let columns: [GridItem] = Array(repeating: GridItem(.fixed(100), spacing: 5), count: 2)
    
    var body: some View {
        NavigationStack {
            listOfMinifig
        }
    }
   
    private var listOfMinifig: some View {
        ScrollView {
            if let minifig = viewModel.searchLegoMinifig {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 300), spacing: 1)]) {
                    ForEach(minifig, id: \.name) { minifiger in
                        listItem(for: minifiger)
                            .frame(width: 150, height: 150)
                            .background(
                                Rectangle()
                                    .stroke(Color.gray)
                            )
                    }
                }
                .padding()
            }
        }
        .searchable(
            text: $viewModel.searchText,
            placement: .navigationBarDrawer(displayMode: .always))
        .onSubmit(of: .search) {
            viewModel.searchMinifig()
        }
        .onAppear {
            viewModel.getMinifiger()
        }
    }
    
//    func lazyVGridForItem(minifiger: Lego.LegoResults) -> some View {
//        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 300), spacing: 1)]) {
//            listItem(for: minifiger)
//                .frame(width: 150, height: 150)
//                .background(
//                    Rectangle()
//                        .stroke(Color.gray)
//                )
//        }
//    }
//    
    func listItem(for minifiger: Lego.LegoResults) -> some View {
        MinifigerPreviewView(
            name: minifiger.name ?? "no name",
            setNum: minifiger.setNum ?? "no set number",
            seturl: URL(string: minifiger.setImageURL ?? "Unknown")
        )
    }
}


#Preview {
    MinifigSrceen()
}
