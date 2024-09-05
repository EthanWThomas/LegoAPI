//
//  LegoParts.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/7/24.
//

import Foundation

struct InventoryLegoParts: Codable {
    
    let results: [PartResult]
    
    struct PartResult: Codable {
        let id: Int?
        let inventoryPartId: Int?
        let part: InventoryLegoParts.Part
        
        enum CodingKeys: String, CodingKey {
            case id
            case inventoryPartId = "inv_part_id"
            case part
        }
    }
}
