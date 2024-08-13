//
//  MinifigSrceen.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/13/24.
//

import SwiftUI

struct MinifigSrceen: View {
    
    @StateObject var viewModel = LegoMinifigSearchVM()
    let columns: [GridItem] = Array(repeating: GridItem(.fixed(170), spacing: 10), count: 2)
    
    let imageUrl: URL?
    
    var body: some View {
        listOfMinifig
    }
    
    private var listOfMinifig: some View {
        VStack {
            if let minifig = viewModel.minifige {
                ForEach(minifig, id: \.name) { minifiger in
                    Text(minifiger.name ?? "no name")
                }
            }
        }
    }
    
   private var tumbnailArt: some View {
        
        AsyncImage(url: imageUrl) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            default:
                Image(systemName: "x.square.fill")
                    .resizable()
                    .foregroundColor(.red)
            }
        }
        .frame(width: 70 ,height: 70)
    }
}


//#Preview {
//    MinifigSrceen()
//}
