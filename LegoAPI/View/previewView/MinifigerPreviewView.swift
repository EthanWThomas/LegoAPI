//
//  MinifigerPreviewView.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/15/24.
//

import SwiftUI

struct MinifigerPreviewView: View {
    let name: String
    let setNum: String
    
    let seturl: URL?
    //    let setImageURL: String
    
    var body: some View {
        VStack {
            displayImageUrl
            details
        }
    }
    
    var details: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.headline)
                .lineLimit(1)
            Text(setNum)
                .bold()
        }
    }
    
    var displayImageUrl: some View {
        AsyncImage(url: seturl) { phase in
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
        .frame(width: 100 ,height: 100)
    }
}

//#Preview {
//    MinifigerPreviewView()
//}
