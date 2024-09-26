//
//  LegoDataModel.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 9/24/24.
//

import Foundation
import SwiftData

@Model
final class LegoDataModel: Identifiable {
    @Attribute(.unique) var setNum: String = UUID().uuidString
    
    var name: String
    var numberOfPart: Int
    var setImageURL: String
    var setURl: String
    var lastModifledDT: String
    
    init(setNum: String, name: String, numberOfPart: Int, setImageURL: String, setURl: String, lastModifledDT: String) {
        self.setNum = setNum
        self.name = name
        self.numberOfPart = numberOfPart
        self.setImageURL = setImageURL
        self.setURl = setURl
        self.lastModifledDT = lastModifledDT
    }
}
