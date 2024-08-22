//
//  SearchBarView.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/21/24.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var seacrhText: String
    @State private var isPickerVisible = false
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(
                    seacrhText.isEmpty ? Color.secondary : Color.accentColor
                )
            
            TextField("Searh by name or set number...", text: $seacrhText)
                .foregroundStyle(Color.accentColor)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundStyle(Color.accentColor)
                        .opacity(seacrhText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            seacrhText = ""
                        }
                    ,alignment: .trailing
                )
                .onTapGesture {
                    isPickerVisible.toggle()
                }
//            Picker("Seletct theme", selection: $seacrhText) {
//                
//            }

        }
        .font(.headline)
        .padding()
//        .frame(width: 250, height: 80)
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
//    SearchBarView(seacrhText: $s)
//}
