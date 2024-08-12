//
//  LegoParts.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/7/24.
//

import Foundation

//"results": [
//    {
//      "id": 20809738,
//      "inv_part_id": 20809738,
//      "part": {
//        "part_num": "48729b",
//        "name": "Bar 1L with Clip [Cut Edges and One Side Hole] [Gap in Clip]",
//        "part_cat_id": 32,
//        "part_url": "https://rebrickable.com/parts/48729b/bar-1l-with-clip-cut-edges-and-one-side-hole-gap-in-clip/",
//        "part_img_url": "https://cdn.rebrickable.com/media/parts/elements/4289538.jpg",
//        "external_ids": {
//          "BrickLink": [
//            "48729",
//            "48729b"
//          ],
//          "BrickOwl": [
//            "664516"
//          ],
//          "Brickset": [
//            "41005",
//            "48729",
//            "55529",
//            "86022",
//            "88428"
//          ],
//          "LDraw": [
//            "48729b"
//          ],
//          "LEGO": [
//            "41005",
//            "48729",
//            "55529",
//            "86022",
//            "88428"
//          ]
//        },
//        "print_of": null
//      },
//      "color": {
//        "id": 0,
//        "name": "Black",
//        "rgb": "05131D",
//        "is_trans": false,
//        "external_ids": {
//          "BrickLink": {
//            "ext_ids": [
//              11
//            ],
//            "ext_descrs": [
//              [
//                "Black"
//              ]
//            ]
//          },
//          "BrickOwl": {
//            "ext_ids": [
//              38
//            ],
//            "ext_descrs": [
//              [
//                "Black"
//              ]
//            ]
//          },
//          "LEGO": {
//            "ext_ids": [
//              26,
//              342
//            ],
//            "ext_descrs": [
//              [
//                "Black",
//                "BLACK"
//              ],
//              [
//                "CONDUCT. BLACK"
//              ]
//            ]
//          },
//          "Peeron": {
//            "ext_ids": [
//              null
//            ],
//            "ext_descrs": [
//              [
//                "black"
//              ]
//            ]
//          },
//          "LDraw": {
//            "ext_ids": [
//              0,
//              256
//            ],
//            "ext_descrs": [
//              [
//                "Black"
//              ],
//              [
//                "Rubber_Black"
//              ]
//            ]
//          }
//        }
//      },

struct InventoryLegoParts: Codable {
    
    let results: [PartResult]
    
    struct PartResult: Codable {
        let id: Int
        let inventoryPartId: Int
        let part: InventoryLegoParts.Part
        
        enum CodingKeys: String, CodingKey {
            case id
            case inventoryPartId
            case part = "inv_part_id"
        }
    }
}
