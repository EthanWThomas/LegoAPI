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
        Picker("Select theme", selection: $selection) {
            ForEach(PartCategory.allCases, id: \.id) { category in
                Text(category.rawValue)
                    .tag(category)
            }
        }
        .pickerStyle(.menu)
        .frame(width: 350, height: 50)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .stroke(Color.gray)
                .shadow(color: .primary.opacity(0.15), radius: 10, x: 0, y: 0)
        )
        .padding()
    }
    
    private enum PartCategory: String, CaseIterable, Identifiable {
        var id: String { self.rawValue }
        
        case Bars
        case Ladders
        case Fences
        case Baseplates
        case Belville
        case Scala
        case Fabuland
        case Brick
        case Brick_Curved
        case Brick_Round_Cone
        case brick_Sloped
        case Brick_Wedged
        case Clikits
        case Container
        case Duplo_Quartro_Primo
        case Electronics
        case Energy_Effects
        case Flag_Signs_Plastics_Cloth
        case Minifig_Accessories
        case Minifig_Heads
        case Minifig_Lower_Body
        case Minfig
        case Minifig_Upper_Body
        case Modulex
        case Other
        case Plates
        case Panels
        case LargeBuildable_Figures
        case Sticker
        case Rock
        case Technic
        case Tools
        case Wheels_and_Tyres
        case Tubes_and_Hoses
        case Tiles
        case Tiles_Round_and_Curved
        case Technic_Bricks
        case Technic_Bushes
        case Technic_Gears
        case Transportation_Land
        case Pneumatics
        case Mechanical
        case Transportation_Sea_and_Air
        case HO_Scale
        case Windows_and_Doors
        case Hinges_Arms_and_Turntables
        case Plates_Angled
        case Windscreens_and_Fuselage
    }
}

//#Preview {
//    PickerVIew()
//}
