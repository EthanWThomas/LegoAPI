//
//  AllMinifigsRequest.swift
//  LegoAPI
//
//  Created by Ethan Thomas on 9/26/24.
//

import Foundation

extension RebrickableAPI {
    
    // MARK: Search Minifigure request
    func searchMinfigs(with searchTerm: String) async throws -> Lego {
        
        guard let url = URL(string: "https://rebrickable.com/api/v3/lego/minifigs/?search=\(searchTerm)&key=\(RebrickableAPI.apiKey)")
        else { throw RequstError.failedToCreateURL }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        switch (response as? HTTPURLResponse)?.statusCode ?? 0 {
            case 200: return try JSONDecoder().decode(Lego.self, from: data)
            case 201, 204, 400, 401, 403, 404, 429: throw try JSONDecoder().decode(ErrorResponse.self, from: data)
            default: throw ResponseError.unownedErrorOccurred
        }
    }
    
    // MARK: Get Minifigure 
    func getMinifig() async throws -> Lego {
        guard let url = URL(string: "https://rebrickable.com/api/v3/lego/minifigs/?key=\(RebrickableAPI.apiKey)")
        else { throw RequstError.failedToCreateURL }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        switch (response as? HTTPURLResponse)?.statusCode ?? 0 {
            case 200: return try JSONDecoder().decode(Lego.self, from: data)
            case 201, 204, 400, 401, 403, 404, 429: throw try JSONDecoder().decode(ErrorResponse.self, from: data)
            default: throw ResponseError.unownedErrorOccurred
        }
    }
    
    // MARK: Get All Search Minifigure With A Theme
    func searchMinifigureWithThemeId(theme id: String, with searchTerm: String) async throws -> Lego {
        guard let url = URL(string: "https://rebrickable.com/api/v3/lego/minifigs/?in_theme_id=\(id)&search=\(searchTerm)&key=\(RebrickableAPI.apiKey)")
        else { throw RequstError.failedToCreateURL }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        switch (response as? HTTPURLResponse)?.statusCode ?? 0 {
            case 200: return try JSONDecoder().decode(Lego.self, from: data)
            case 201, 204, 400, 401, 403, 404, 429: throw try JSONDecoder().decode(ErrorResponse.self, from: data)
            default: throw ResponseError.unownedErrorOccurred
        }
    }
    
    // MARK: Get All Minifigure with a Theme
    func getMinifigureWithATheme(theme id: String) async throws -> Lego {
        guard let url = URL(string: "https://rebrickable.com/api/v3/lego/minifigs?in_theme_id=\(id)&key=\(RebrickableAPI.apiKey)")
        else { throw RequstError.failedToCreateURL }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        switch (response as? HTTPURLResponse)?.statusCode ?? 0 {
            case 200: return try JSONDecoder().decode(Lego.self, from: data)
            case 201, 204, 400, 401, 403, 404, 429: throw try JSONDecoder().decode(ErrorResponse.self, from: data)
            default: throw ResponseError.unownedErrorOccurred
        }
    }
    
    // MARK: - Get all Minifigure Inventory Parts
    // Get a list of all Inventory Parts in this Minifig.
    func getMinifigerInvetory(setNum: String) async throws -> InventoryLegoParts {
        guard let url = URL(string: "https://rebrickable.com/api/v3/lego/minifigs/\(setNum)/parts/?key=\(RebrickableAPI.apiKey)")
        else { throw RequstError.failedToCreateURL }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        switch (response as? HTTPURLResponse)?.statusCode ?? 0 {
            case 200: return try JSONDecoder().decode(InventoryLegoParts.self, from: data)
            case 201, 204, 400, 401, 403, 404, 429: throw try JSONDecoder().decode(ErrorResponse.self, from: data)
            default: throw ResponseError.unownedErrorOccurred
        }
    }
    
    // MARK: - Get all Minifigure in a set they came in
    func getAllMinifigsSetCameIn(setNumber: String) async throws -> Lego {
        guard let url = URL(string: "https://rebrickable.com/api/v3/lego/minifigs/\(setNumber)/sets/?key=\(RebrickableAPI.apiKey)")
        else { throw RequstError.failedToCreateURL }
        
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        switch (response as? HTTPURLResponse)?.statusCode ?? 0 {
            case 200: return try JSONDecoder().decode(Lego.self, from: data)
            case 201, 204, 400, 401, 403, 404, 429: throw try JSONDecoder().decode(ErrorResponse.self, from: data)
            default: throw ResponseError.unownedErrorOccurred
        }
    }
}
