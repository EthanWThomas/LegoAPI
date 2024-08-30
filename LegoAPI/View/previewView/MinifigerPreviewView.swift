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
    
    let numberOfpart: Int
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
                .lineLimit(1)
                .padding()
            HStack {
                Text(setNum)
                    .foregroundStyle(Color("figNumberColor"))
//                    .font(.subheadline)
                    .fontWeight(.light)
                Text("(\(numberOfpart.formatted(.number)))part")
            }
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
                    Image("yellowMinifiger")
                        .resizable()
            }
        }
        .frame(width: 100 ,height: 100)
    }
}

//#Preview {
//    MinifigerPreviewView()
//}
