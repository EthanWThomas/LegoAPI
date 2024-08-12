//
//  RebrickableAPI.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 8/7/24.
//

import Foundation

struct RebrickableAPI {
    
    static private var apiKey = "428202502f439447097e345473057945"
    
    // MARK: - Get all Minifiger
    func getMinfigs(with searchTerm: String) async throws -> [Lego.LegoResults] {
        
        guard let url = URL(string: "https://rebrickable.com/api/v3/lego/minifigs/?key=\(RebrickableAPI.apiKey)")
        else { throw RequstError.failedToCreateURL }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        switch (response as? HTTPURLResponse)?.statusCode ?? 0 {
            case 200: return try JSONDecoder().decode([Lego.LegoResults].self, from: data)
            case 201, 204, 400, 401, 403, 404, 429: throw try JSONDecoder().decode(ErrorResponse.self, from: data)
            default: throw ResponseError.unownedErrorOccurred
        }
    }
    
    // MARK: - Get all Minifigs in all the sets it came in
    func getAllMinifigsSetCameIn(setNumber: String) async throws -> [Lego.LegoResults] {
        
        guard let url = URL(string: "https://rebrickable.com/api/v3/lego/minifigs/\(setNumber)/sets/?key=\(RebrickableAPI.apiKey)")
        else { throw RequstError.failedToCreateURL }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        switch (response as? HTTPURLResponse)?.statusCode ?? 0 {
            case 200: return try JSONDecoder().decode([Lego.LegoResults].self, from: data)
            case 201, 204, 400, 401, 403, 404, 429: throw try JSONDecoder().decode(ErrorResponse.self, from: data)
            default: throw ResponseError.unownedErrorOccurred
        }
    }
    
    // MARK: - Get all lego parts
    func getParts(with searchTerm: String) async throws -> [AllParts.PartResults] {
        guard let url = URL(string: "https://rebrickable.com/api/v3/lego/parts/?key=\(RebrickableAPI.apiKey)")
                
        else { throw RequstError.failedToCreateURL }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        switch (response as? HTTPURLResponse)?.statusCode ?? 0 {
            case 200: return try JSONDecoder().decode([AllParts.PartResults].self, from: data)
            case 201, 204, 400, 401, 403, 404, 429: throw try JSONDecoder().decode(ErrorResponse.self, from: data)
            default: throw ResponseError.unownedErrorOccurred
        }
    }
    
    // MARK: - Get a list of all Colors a Part has appeared
    func getListOfAllColorAndPart(partNum: String) async throws -> [PartsAndColor.PartsAndColorResults] {
        guard let url = URL(string: "https://rebrickable.com/api/v3/lego/parts/\(partNum)/colors/?key=\(RebrickableAPI.apiKey)")
        else { throw RequstError.failedToCreateURL }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        switch (response as? HTTPURLResponse)?.statusCode ?? 0 {
            case 200: return try JSONDecoder().decode([PartsAndColor.PartsAndColorResults].self, from: data)
            case 201, 204, 400, 401, 403, 404, 429: throw try JSONDecoder().decode(ErrorResponse.self, from: data)
            default: throw ResponseError.unownedErrorOccurred
        }
    }
    
    // MARK: - Get all Lego sets
    func getAllLegoSets(with searchTerm: String) async throws -> [LegoSet.SetResults] {
        guard let url = URL(string: "https://rebrickable.com/api/v3/lego/sets/?key=\(RebrickableAPI.apiKey)")
        else { throw RequstError.failedToCreateURL }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        switch (response as? HTTPURLResponse)?.statusCode ?? 0 {
            case 200: return try JSONDecoder().decode([LegoSet.SetResults].self, from: data)
            case 201, 204, 400, 401, 403, 404, 429: throw try JSONDecoder().decode(ErrorResponse.self, from: data)
            default: throw ResponseError.unownedErrorOccurred
        }
    }
    
    // MARK: - Get a list of all Inventory Parts in this Set
    func getInvetoryPartInASet(setNum: String) async throws -> [InventoryLegoParts.PartResult] {
        guard let url = URL(string: "https://rebrickable.com/api/v3/lego/sets/\(setNum)/parts/?key=\(RebrickableAPI.apiKey)")
                
        else { throw RequstError.failedToCreateURL }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        switch (response as? HTTPURLResponse)?.statusCode ?? 0 {
            case 200: return try JSONDecoder().decode([InventoryLegoParts.PartResult].self, from: data)
            case 201, 204, 400, 401, 403, 404, 429: throw try JSONDecoder().decode(ErrorResponse.self, from: data)
            default: throw ResponseError.unownedErrorOccurred
        }
    }
    
    // MARK: Return all Themes
    func returnAllThemes() async throws -> [Themes.ThemesResults] {
        guard let url = URL(string: "https://rebrickable.com/api/v3/lego/themes/?key=\(RebrickableAPI.apiKey)")
                
        else { throw RequstError.failedToCreateURL }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        switch (response as? HTTPURLResponse)?.statusCode ?? 0 {
            case 200: return try JSONDecoder().decode([Themes.ThemesResults].self, from: data)
            case 201, 204, 400, 401, 403, 404, 429: throw try JSONDecoder().decode(ErrorResponse.self, from: data)
            default: throw ResponseError.unownedErrorOccurred
        }
    }
}

enum RequstError: Error {
    case failedToCreateURL
}

enum ResponseError: Error {
    case unownedErrorOccurred
}

struct ErrorResponse: Error, Decodable {
    let status: Int
    let resson: String
}
