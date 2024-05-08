//
//  WardMaxController.swift
//  WardMax
//
//  Created by Edgar Zarco on 4/7/24.
//

import Foundation

struct WardMaxController{
    enum NetworkError: Error{
        case badURL, badResponse, badData
    }
    
    //dev
    private let baseURI = URL(string: "http://localhost:5000/WardMax/")
    
    func GetAllCards() async throws -> [ApiCard] {
        let(data, response) = try await URLSession.shared.data(from: URL(string: "\(baseURI!)cc/all")!)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        let retCards = try JSONDecoder().decode([ApiCard].self, from: data)
        
        return retCards
    }
    
    
    func GetCardById(id: Int) async throws -> ApiCard {
        let(data, response) = try await URLSession.shared.data(from: URL(string: "\(baseURI!)cc/\(id)")!)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        let retCard = try JSONDecoder().decode(ApiCard.self, from: data)
        
        return retCard
    }
    
    func GetPointConversionByCardId(id: Int) async throws -> ApiPointConversion {
        var retConversion: ApiPointConversion
        let(data, response) = try await URLSession.shared.data(from: URL(string: "\(baseURI!)cc/pointconversion/\(id)")!)
                        
        guard let response = response as? HTTPURLResponse else{
            throw NetworkError.badResponse
        }
        
        if(response.statusCode == 200){
            retConversion = try JSONDecoder().decode(ApiPointConversion.self, from: data)
        }
        else if(response.statusCode == 404){
            throw NetworkError.badData
        }else{
            throw NetworkError.badResponse
        }
        return retConversion
    }
    
    func SearchCards(query: String) async throws -> [ApiCard] {
        var request = URLRequest(url: URL(string: "http://localhost:5000/WardMax/cc/search")!)
        request.httpMethod = "POST"
        request.addValue("text/plain", forHTTPHeaderField: "Content-Type")
        
        if let data = query.data(using: .utf8) {
            request.httpBody = data
        } else{
            print("Cannot utf8")
        }
                
        let (data, response) = try await URLSession.shared.data(for: request)
        

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        let retCardSearch = try JSONDecoder().decode([ApiCard].self, from: data)
        return retCardSearch
    }
    
}
