//
//  MinifigDetailPreviewView.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/23/24.
//

import SwiftUI

struct MinifigDetailPreviewView: View {
    let name: String
    let figNumber: String
    let figURL: URL?
//    let numberpart: Int
//    
//    let setNumber: String
//    let setURL: URL?
//    
//    let partNumber: String
//    let partURL: URL?
    
    
    var body: some View {
        title
    }
    
    var title: some View {
        VStack {
            Text("LEGO SET \(figNumber) - \(name)")
                .font(.headline)
            displayFigUrl
        }
    }
    
    var displayFigUrl: some View {
        AsyncImage(url: figURL) { phase in
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
                        .foregroundColor(.red)
            }
        }
        .frame(width: 150 ,height: 150)
    }
}

//#Preview {
//    MinifigDetailPreviewView()
//}
