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
    @State var setMinifigerInventoryExpanded = true
    @State var setMOCSExpanded = false
    
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
                setMinifiger
                setInventory
                setMOCS
            }
            .listStyle(.sidebar)
            .onAppear {
                inventoryViewModel.getInventoryPart(with: Legoset.setNumber ?? "No set number")
                inventoryViewModel.getInventoryMinifigerInSet(with: Legoset.setNumber ?? "No set number")
                letSetViewModel.getAlternateBuilds(with: Legoset.setNumber ?? "No set number")
            }
        }
    }
    
    private var setInventory: some View {
        Section(isExpanded: $inventoryExpanded) {
            if let part = inventoryViewModel.setInventoryPart {
                ForEach(part, id: \.id) { legoPart in
                    setInventoryDisplay(
                        partNumbber: legoPart.part.partNumber ?? "No part number",
                        url: legoPart.part.partImageURL,
                        set: legoPart.quantity
                    )
                }
                .onSubmit {
                    inventoryViewModel.getInventoryPart(with: Legoset.setNumber ?? "No set number")
                }
            }
        } header: {
            Text("Inventory")
                .font(.headline)
        }
    }
    
    private var setMinifiger: some View {
        Section(isExpanded: $setMinifigerInventoryExpanded) {
            if let setMinifiger = inventoryViewModel.getInventoryMinifiger {
                ForEach(setMinifiger, id: \.setNum) { minifiger in
                    setMinifigerDisplay(
                        fig: minifiger.setNum ?? "No set number",
                        fig: minifiger.setImageURL
                    )
                }
                .onSubmit {
                    inventoryViewModel.getInventoryMinifigerInSet(with: Legoset.setNumber ?? "No set number")
                }
            }
        } header: {
            Text("Minifigers")
                .font(.headline)
        }
    }
    
    private var setMOCS: some View {
        Section(isExpanded: $setMOCSExpanded) {
            if let legoMOCS = letSetViewModel.legoSetMOCS {
                ForEach(legoMOCS, id: \.setNumber) { alternateBuilds in
                    setMOCSDisplay(
                        name: alternateBuilds.name,
                        year: alternateBuilds.year,
                        set: alternateBuilds.setNumber,
                        moc: alternateBuilds.mocImageUrl
                    )
                }
                .onSubmit {
                    letSetViewModel.getAlternateBuilds(with: Legoset.setNumber ?? "No Set number")
                }
            }
        } header: {
            Text("Alternate Builds")
                .font(.headline)
        }
    }
    
    private func setInventoryDisplay(partNumbber: String, url: String?, set quantity: Int) -> some View {
        HStack(alignment: .top, spacing: 12) {
            displayUrlImage(url: url)
                .frame(width: 80, height: 80)
            HStack(alignment: .center) {
                Text("\(quantity.formatted(.number)) x")
                    .font(.headline)
                    .padding()
                Text(partNumbber)
                    .font(.headline)
            }
        }
    }
    
    private func setMinifigerDisplay(fig number: String, fig url: String?) -> some View {
        HStack(alignment: .top, spacing: 12) {
            displayUrlImage(url: url)
                .frame(width: 100, height: 100)
            VStack(alignment: .leading) {
                Text(number)
                    .font(.headline.bold())
            }
        }
    }
    
    private func setMOCSDisplay(name: String?, year: Int?, set number: String?, moc url: String?) -> some View {
        HStack(alignment: .center) {
            displayUrlImage(url: url)
                .frame(width: 150, height: 150)
            VStack(alignment: .leading) {
                Text(name ?? "No MOC Name")
                    .font(.headline)
                Text(number ?? "No MOC Set Number")
                    .font(.headline)
                Text("It was Made in \(year ?? 0000)")
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
