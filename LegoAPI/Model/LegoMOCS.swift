//
//  LegoMOCS.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 9/5/24.
//

import Foundation

struct LegoMOCS: Codable {
    let results: [LegoMOCSResult]
    
    struct LegoMOCSResult: Codable {
        let setNumber: String
        let name: String
        let year: Int
        let themeId: Int
        let numberOfPart: Int
        let mocImageUrl: String
        let mocURl: String
    }
}
