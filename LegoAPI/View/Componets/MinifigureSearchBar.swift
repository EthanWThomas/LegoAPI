//
//  MinifigureSearchBar.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 9/26/24.
//

import SwiftUI

struct MinifigureSearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(
                    searchText.isEmpty ? Color.secondary : Color.accentColor
                )
            TextField("Search Minifigure", text: $searchText)
                .foregroundStyle(Color.accentColor)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundStyle(Color.accentColor)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                        }
                    ,alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .padding()
        .frame(width: 200, height: 50)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .stroke(Color.gray)
                .shadow(color: .primary.opacity(0.15), radius: 10, x: 0, y: 0)
        )
        .padding()
    }
}

//#Preview {
//    MinifigureSearchBar()
//}
