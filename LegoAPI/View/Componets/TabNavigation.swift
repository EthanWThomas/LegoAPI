//
//  TabNavigation.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/22/24.
//

import SwiftUI

struct TabNavigation: View {
    var body: some View {
        TabView {
            MinifigSrceen()
                .tabItem { Label("Minifiger", systemImage: "figure.stand") }
            
            LegoSetView()
                .tabItem { Label("Set", systemImage: "archivebox.circle.fill") }
            
            LegoPartView()
                .tabItem { Label("Part", systemImage: "p.square.fill") }
        }
    }
}

#Preview {
    TabNavigation()
}
