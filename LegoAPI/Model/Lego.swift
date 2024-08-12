//
//  Minifigs.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/6/24.
//

import Foundation

struct Lego: Codable {
    let results: [LegoResults]
    
    struct LegoResults: Codable {
        
        let setNum: String
        let name: String?
        let numberOfPart: Int
        let setImageURL: String?
        let setURL: String?
        let lastModifledDT: String
        
        enum CodingKeys: String, CodingKey {
            case setNum = "set_num"
            case name
            case numberOfPart = "num_parts"
            case setImageURL = "set_img_url"
            case setURL = "set_url"
            case lastModifledDT = "last_modified_dt"
        }
    }
}
