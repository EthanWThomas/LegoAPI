//
//  PartsAndColor.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/8/24.
//

import Foundation

struct PartsAndColor: Codable {
    
    let results: [PartsAndColorResults]
    
    struct PartsAndColorResults: Codable {
        let colorID: Int
        let colorName: String
        let numberOfSet: Int
        let numberOfSetParts: Int
        let partImageUrL: String
        let elements: [String]
        
        enum CodingKeys: String, CodingKey {
            case colorID = "color_id"
            case colorName = "color_name"
            case numberOfSet = "num_sets"
            case numberOfSetParts = "num_set_parts"
            case partImageUrL = "part_img_url"
            case elements = "elements"
        }
    }
}
