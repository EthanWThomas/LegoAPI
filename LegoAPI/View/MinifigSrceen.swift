//
//  MinifigSrceen.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/13/24.
//

import SwiftUI

struct MinifigSrceen: View {
    
    @StateObject var viewModel = LegoMinifigSearchVM()
    @StateObject var setViewModel = MinifigInSetCameInVM()
    @StateObject var partViewModel = PartsVM()
   
    let columns: [GridItem] = Array(repeating: GridItem(.fixed(100), spacing: 5), count: 2)
    
    // TODO: - add a custom search bar and theme picker
    var body: some View {
        NavigationStack {
            minifigSelected
            Section("Minifiger") {
                listOfMinifig
            }
        }
       
    }
    
    private var minifigSelected: some View {
        VStack {
            SearchBarView(seacrhText: $viewModel.searchText)
//            Picker("Select theme", selection: $viewModel.searchText) {
//                ForEach(viewModel.legotheme ?? [], id: \.id) { theme in
//                    Text(theme.id.formatted(.number))
//                }
//            }
            .pickerStyle(.menu)
        }
        .onSubmit {
            viewModel.searchMinifig()
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
                                    .stroke(Color.gray)
                            )
                    }
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.getMinifiger()
        }
    }    
    
    func listItem(for minifiger: Lego.LegoResults) -> some View {
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
