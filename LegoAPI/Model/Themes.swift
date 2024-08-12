//
//  Themes.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/7/24.
//

import Foundation

struct Themes: Codable {
    
    let results: [ThemesResults]
    
    struct ThemesResults: Codable {
        let id: Int
        let parentId: Int?
        let name: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case parentId = "parent_id"
            case name
        }
    }
}
