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
    
    var body: some View {
        VStack {
            displayImageUrl
                .padding()
            details
        }
    }
    
    var details: some View {
        VStack {
            HStack {
                Text(name)
                    .font(.headline.bold())
                    .lineLimit(1)
                    .foregroundStyle(Color.black)
            }
            HStack {
                Text(setNum)
                Text("(\(numberOfpart.formatted(.number)))part")
            }
            .foregroundStyle(Color.gray)
            .fontWeight(.light)
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
