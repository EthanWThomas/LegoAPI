//
//  Color.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/7/24.
//

import Foundation

extension InventoryLegoParts.Part.ColorOFPart {
    
    struct ColorExternalIDs: Codable {
        let brickLink: BrickLink?
        let brickOwl: BrickOwl?
        let lego: Lego?
        let peeron: Peeron?
        let lDraw: LDraw?
        
        enum CodingKeys: String, CodingKey {
            case brickLink = "BrickLink"
            case brickOwl = "BrickOwl"
            case lego = "LEGO"
            case peeron = "Peeron"
            case lDraw = "LDraw"
        }
        
        struct BrickLink: Codable {
            let extIds: [Int]?
            let extDescrs: [[String]]?
            
            enum CodingKeys: String, CodingKey {
                case extIds = "ext_ids"
                case extDescrs = "ext_descrs"
            }
        }
        
        struct BrickOwl: Codable {
            let extIds: [Int]?
            let extDescrs: [[String]]?
            
            enum CodingKeys: String, CodingKey {
                case extIds = "ext_ids"
                case extDescrs = "ext_descrs"
            }
        }
        
        struct Lego: Codable {
            let extIds: [Int]?
            let extDescrs: [[String]]?
            
            enum CodingKeys: String, CodingKey {
                case extIds = "ext_ids"
                case extDescrs = "ext_descrs"
            }
        }
        
        struct Peeron: Codable {
            let extIds: [Int]?
            let extDescrs: [[String]]?
            
            enum CodingKeys: String, CodingKey {
                case extIds = "ext_ids"
                case extDescrs = "ext_descrs"
            }
        }
        
        struct LDraw: Codable {
            let extIds: [Int]?
            let extDescrs: [[String]]?
            
            enum CodingKeys: String, CodingKey {
                case extIds = "ext_ids"
                case extDescrs = "ext_descrs"
            }
        }
    }
}
