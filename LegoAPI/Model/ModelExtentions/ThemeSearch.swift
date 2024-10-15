//
//  ThemeSearch.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 10/3/24.
//

import Foundation

enum LegoThemes: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    
    case Star_Wars = "158"
    case Monkie_Kid = "693"
    case Castle = "198"
    case City = "57"
    case Space = "127"
    case Ninjago = "435"
    case Collectible_Minifigures = "555"
    case Disney = "687"
    case Eives = "600"
    case SpongeBob_SquarePants = "272"
    case Harry_Potter = "246"
    case Legends_of_Chima = "571"
    case Minecraft = "577"
    case Pirates = "148"
    case Super_Heros_DC = "698"
    case Super_Heros_Marvel = "706"
    case Avatar = "724"
    case Avatar_The_Last_Airbender = "317"
    case Despicable_Me = "763"
    case ScoobyDoo = "603"
    case Speed_Racer = "717"
    case Speed_Champions = "601"
}

extension LegoThemes {
    var displayName: String {
        switch self {
            case .Star_Wars:
                return "Star Wars"
            case .Monkie_Kid:
                return "Monkie Kid"
            case .Castle:
                return "Castle"
            case .City:
                return "City"
            case .Space:
                return "Space"
            case .Ninjago:
                return "Ninjago"
            case .Collectible_Minifigures:
                return "Collectible Minifigures"
            case .Disney:
                return "Disney"
            case .Eives:
                return "Eives"
            case .SpongeBob_SquarePants:
                return "SpongeBob SquarePants"
            case .Harry_Potter:
                return "Harry Potter"
            case .Legends_of_Chima:
                return "Legends of Chima"
            case .Minecraft:
                return "Minecraft"
            case .Pirates:
                return "Pirates"
            case .Super_Heros_DC:
                return "Super Heros DC"
            case .Super_Heros_Marvel:
                return "Super Heros Marvel"
            case .Avatar:
                return "Avatar"
            case .Avatar_The_Last_Airbender:
                return "Avatar The Last Airbender"
            case .Despicable_Me:
                return "Despicable Me"
            case .ScoobyDoo:
                return "ScoobyDoo"
            case .Speed_Racer:
                return "Speed Racer"
            case .Speed_Champions:
                return "Speed Champions"
        }
    }
}
