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
        listOfMinifig
    }
    
    private var listOfMinifig: some View {
        ScrollView {
            if let minifig = viewModel.minifige {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 300), spacing: 1)]) {
                    ForEach(minifig, id: \.name) { minifiger in
                        listItem(for: minifiger)
                            .frame(width: 150, height: 150)
                            .background(
                                Rectangle()
                                    .stroke(Color.gray)
                            )
//                        LazyVGrid(columns: columns, content: {
//                            listItem(for: minifiger)
//                        })
                    }
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.getMinifiger()
        }
        //        NavigationStack {
        //            VStack {
        //                if let minifig = viewModel.minifige {
        //                    ForEach(minifig, id: \.name) { minifig in
        //                        listItem(for: minifig)
        //                    }
        //                }
        //            }
        //        }
        //        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        //        .onSubmit(of: .search) {
        //            viewModel.
        //        }
    }
    
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
