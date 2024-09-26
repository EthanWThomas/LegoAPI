//
//  LegoParts.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/7/24.
//

import Foundation

struct InventoryLegoParts: Codable {
    
    let results: [PartResult]
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
    
    struct PartResult: Codable {
        let id: Int?
        let inventoryPartId: Int?
        let part: InventoryLegoParts.Part
        let setNumber: String
        let quantity: Int
        let isSpare: Bool
        let elementId: String?
        let numberOfSet: Int
        
        enum CodingKeys: String, CodingKey {
            case id
            case inventoryPartId = "inv_part_id"
            case part
            case setNumber = "set_num"
            case quantity = "quantity"
            case isSpare = "is_spare"
            case elementId = "element_id"
            case numberOfSet = "num_sets"
        }
    }
}
