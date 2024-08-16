//
//  ContentView.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.wave.2")
                .font(.largeTitle)
            VStack(alignment: .leading) {
                Text("Plus")
                    .font(.largeTitle)
                Text("Name")
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    ContentView()
}
