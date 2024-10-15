//
//  RebrickableAPI.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/7/24.
//

import Foundation

struct RebrickableAPI {
    static var apiKey = "428202502f439447097e345473057945"
}

enum RequstError: Error {
    case failedToCreateURL
}

enum ResponseError: Error {
    case unownedErrorOccurred
}

struct ErrorResponse: Error, Decodable {
    let detail: String
}
