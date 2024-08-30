//
//  MinifigerDetailView.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/22/24.
//

import SwiftUI

struct MinifigerDetailView: View {
    var lego: Lego.LegoResults
//    var part: MinifigerPart.MinifigerPartResults
//    var set: LegoSet.SetResults
    
    @State var setExpanded = false
    @State var inventoryExpanded = true
    
    @StateObject var minifigesInetViewModel: MinifigInSetCameInVM
    @StateObject var parViewModel: PartsVM
    
    var body: some View {
        title
        Spacer()
        List {
            minifigInSet
            partInventory
        }
        .listStyle(.sidebar)
        .onAppear {
            minifigesInetViewModel.getMinifigInSetCameIn(figNumber: lego.setNum ?? "no fig number")
            parViewModel.getminifigePart(figNumber: lego.setNum ?? "no fig number")
        }
    }
    
    private var title: some View {
        MinifigerPreviewView(name: lego.name ?? "No name", setNum: lego.setNum ?? "No set number", numberOfpart: lego.numberOfPart ?? 0, seturl: URL(string: lego.setImageURL ?? "Unknown"))
        
    }
    
    private var minifigInSet: some View {
        Section(isExpanded: $setExpanded) {
            if let set = minifigesInetViewModel.minifigInSet {
                VStack {
                    ForEach(set, id: \.setNum) { legoSet in
                        AsyncImage(url: URL(string: legoSet.setImageURL ?? "Unkown")) { phase in
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
                            }
                        }
                        .frame(width: 50, height: 50)
                        Text(legoSet.name ?? "no name")
                        HStack {
                            Text(legoSet.name ?? "no name")
                            Text(legoSet.setNum ?? "no set number")
                            Text(legoSet.numberOfPart?.formatted(.number) ?? "0")
                        }
                    }
                    .frame(width: 100, height: 100)
                    .background(
                        Rectangle()
                            .stroke(Color.gray)
                    )
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
    
    private var detail: some View {
        HStack {
            
        }
    }
    
    private var partInventory: some View {
        Section(isExpanded: $inventoryExpanded) {
            if let part = parViewModel.part {
                VStack {
                    ForEach(part ,id: \.name) { legoPart in
                        AsyncImage(url: URL(string: legoPart.partImageUrl ?? "Unknown")) { phase in
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
                            }
                        }
                        .frame(width: 100, height: 100)
                        Text(legoPart.name ?? "no name")
                        Text(legoPart.partNumber ?? "no part number")
                    }
                }
                .onSubmit {
                    parViewModel.getminifigePart(figNumber: lego.setNum ?? "no fig number")
                }
            }
        } header: {
            Text("Inventory")
                .font(.headline)
        }
    }
}

//#Preview {
//    MinifigerDetailView()
//}
