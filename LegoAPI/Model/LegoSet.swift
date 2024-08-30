//
//  Set.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/7/24.
//

import Foundation

struct LegoSet: Codable {
    let results: [SetResults]
    
    struct SetResults: Codable {
        let setNumber: String?
        let name: String?
        let year: String?
        let themeID: String?
        let numberOfParts: Int?
        let setImageURL: String?
        let setURL: String?
        let lastModifieDT: String?
        
        enum CodingKeys: String, CodingKey {
            case setNumber = "set_num"
            case name
            case year
            case themeID = "theme_id"
            case numberOfParts = "num_parts"
            case setImageURL = "set_img_url"
            case setURL = "set_url"
            case lastModifieDT = "last_modified_d"
        }
    }
}
