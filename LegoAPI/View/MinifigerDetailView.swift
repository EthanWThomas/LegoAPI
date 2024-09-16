//
//  MinifigerDetailView.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/22/24.
//

import SwiftUI

struct MinifigerDetailView: View {
    var lego: Lego.LegoResults
    
    @State var setExpanded = true
    @State var inventoryExpanded = false
    
    @StateObject var minifigesInetViewModel: MinifigInSetCameInVM
    @StateObject var partViewModel: PartsVM
    
    var body: some View {
        title
        List {
            minifigInSet
            partInventory

        }
        .listStyle(.sidebar)
        .onAppear {
            minifigesInetViewModel.getMinifigInSetCameIn(figNumber: lego.setNum ?? "no fig number")
            partViewModel.getminifigePart(figNumber: lego.setNum ?? "no fig number")
        }
    }
    
    private var title: some View {
        VStack(alignment: .center) {
            displayUrlImage(url: lego.setImageURL, failedUrl: "legoLogo")
                .frame(width: 200, height: 200)
            Text(lego.name ?? "No Name")
                .font(.headline.bold())
            Text(lego.setNum ?? "No Set Number")
                .font(.subheadline)
        }
    }
    
    private var minifigInSet: some View {
        Section(isExpanded: $setExpanded) {
            if let set = minifigesInetViewModel.minifigInSet {
                ForEach(set, id: \.setNum) { legoSet in
                    HStack(alignment: .top, spacing: 12) {
                        displayUrlImage(
                            url: legoSet.setImageURL, failedUrl: "legoLogo"
                        )
                        .frame(width: 150, height: 150)
                        setDetailDisplay(
                            name: legoSet.name ?? "No Name",
                            fig: legoSet.setNum ?? "No Set number",
                            inventory: legoSet.numberOfPart ?? 0,
                            set: legoSet.setImageURL
                        )
                    }
                }
                .onSubmit {
                    minifigesInetViewModel.getMinifigInSetCameIn(figNumber: lego.setNum ?? "no name")
                }
            }
        } header: {
            Text("This figure appears in the following Sets")
                .font(.headline)
        }
    }
    
    private var partInventory: some View {
        Section(isExpanded: $inventoryExpanded) {
            if let part = partViewModel.inventoryPart {
                VStack {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 300), spacing: 1)]) {
                        ForEach(part ,id: \.id) { legoPart in
                            inventoryMinifigerPartDisplay(
                                part: legoPart.part.partNumber,
                                part: legoPart.quantity,
                                url: legoPart.part.partImageURL
                            )
                            .frame(width: 160, height: 200)
                            .background(
                                Rectangle()
                                    .stroke(Color.gray)
                            )
                        }
                    }
                }
                .onSubmit {
                    partViewModel.getminifigePart(figNumber: lego.setNum ?? "no fig number")
                }
            }
        } header: {
            Text("Inventory")
                .font(.headline)
        }
    }
    
    private func inventoryMinifigerPartDisplay(
        part number: String?,
        part quantity: Int,
        url: String?) -> some View {
        VStack {
            AsyncImage(url: URL(string: url ?? "Unknown")) { phase in
                switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                    default:
                        Image("redBrick")
                            .resizable()
                }
            }
            .frame(width: 100, height: 100)
            .padding()
            HStack {
                Text("\(quantity.formatted(.number)) x")
                    .font(.headline)
                Text(number ?? "No Name")
                    .font(.headline)
                    .foregroundStyle(Color("minifigerPartColor"))
                    .lineLimit(1)
                    .padding()
            }
        }
    }
    
    private func setDetailDisplay(name: String, fig number: String, inventory: Int, set url: String?) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(name)
                .font(.headline.bold())
            Text("Set number-\(number)")
                .font(.subheadline)
                .font(.system(size: 12))
            Text("(\(inventory.formatted(.number)) of parts)")
                .font(.subheadline)
        }
    }
    
    private func displayUrlImage(url: String?, failedUrl: String) -> some View {
        HStack {
            AsyncImage(url: URL(string: url ?? "Unknown")) { phase in
                switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                    default:
                        Image(failedUrl)
                            .resizable()
                }
            }
        }
    }
}

//#Preview {
//    MinifigerDetailView()
//}
