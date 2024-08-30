//
//  MinifigerPart.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/23/24.
//

import Foundation

struct MinifigerPart: Codable {
    let results: [MinifigerPartResults]
    
    struct MinifigerPartResults: Codable {
        let id: Int
        let inventoryPartId: Int
        let part: AllParts
        let color: PartsAndColor
        let setNumber: String
        let quantity: String
        let isSpare: Bool
        let element_id: String
        let NumberOfSet: Int
        
        enum CodingKeys: String, CodingKey {
            case id
            case inventoryPartId = "inv_part_id"
            case part
            case color
            case setNumber = "set_num"
            case quantity
            case isSpare = "is_spare"
            case element_id = "element_id"
            case NumberOfSet = "num_sets"
        }
    }
}
