//
//  LegoSetDetailView.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/22/24.
//

import SwiftUI

struct LegoSetDetailView: View {
    var Legoset: LegoSet.SetResults
    
    
    @State var inventoryExpanded = false
    
    @StateObject var letSetViewModel: LegoSetVM
    @StateObject var inventoryViewModel: InventoryLegoPartVM
    
    var body: some View {
        VStack(alignment: .center) {
            displayUrlImage(url: Legoset.setImageURL)
                .frame(width: 250, height: 250)
            Text(Legoset.name ?? "No Name")
                .font(.headline.bold())
            Text(Legoset.setNumber ?? "No set number")
                .font(.headline)
            Text("Came out in \(Legoset.year ?? 0000)")
                .font(.headline)
            List {
                setInventory
            }
            .listStyle(.sidebar)
            .onAppear {
                inventoryViewModel.getInventoryPart(with: Legoset.setNumber ?? "No set number")
            }
        }
    }
    
    private var setInventory: some View {
        Section(isExpanded: $inventoryExpanded) {
            if let part = inventoryViewModel.setInventoryPart {
                ForEach(part, id: \.id) { legoPart in
                    setInventoryDisplay(
                        partNumbber: legoPart.part.partNumber ?? "No part number",
                        url: legoPart.part.partImageURL
                    )
                }
                .onSubmit {
                    inventoryViewModel.getInventoryPart(with: Legoset.setNumber ?? "No set number")
                }
            }
        } header: {
            Text("Inventory")
        }

    }
    
    private func setInventoryDisplay(partNumbber: String, url: String?) -> some View {
        HStack(alignment: .top, spacing: 12) {
            displayUrlImage(url: url)
                .frame(width: 80, height: 80)
            VStack(alignment: .leading) {
                Text(partNumbber)
                    .font(.headline)
            }
        }
    }
    
    private func displayUrlImage(url: String?) -> some View {
        AsyncImage(url: URL(string: url ?? "Unknown")) { phase in
            switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                default:
                    Image("legoLogo")
                        .resizable()
            }
        }
    }
}

//#Preview {
//    LegoSetDetailView()
//}
