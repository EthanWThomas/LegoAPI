//
//  PickerVIew.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/22/24.
//

import SwiftUI

struct PickerVIew: View {
    
    @Binding var selection: String
    let theme: [Themes.ThemesResults]
    
    var body: some View {
        Picker("Select theme", selection: $selection) {
            ForEach(theme, id: \.id) { themeId in
                Text(themeId.name)
            }
        }
        .frame(width: 100, height: 50)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .stroke(Color.gray)
                .shadow(color: .primary.opacity(0.15), radius: 10, x: 0, y: 0)
        )
        .pickerStyle(.wheel)
    }
}

//#Preview {
//    PickerVIew(theme: <#[Themes.ThemesResults]#>)
//}
