//
//  PickerVIew.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/22/24.
//

import SwiftUI

struct PartPickerVIew: View {
    
    @Binding var selection: String
    
    var body: some View {
        Picker("Select Category", selection: $selection) {
            ForEach(PartCategory.allCases, id: \.id) { category in
                Text(category.displayName)
                    .tag(category.rawValue)
                    .lineLimit(1)
            }
        }
        .padding()
        .frame(width: 170, height: 50)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .stroke(Color.gray)
                .shadow(color: .primary.opacity(0.15), radius: 10, x: 0, y: 0)
        )
    }
}


//#Preview {
//    PickerVIew()
//}
