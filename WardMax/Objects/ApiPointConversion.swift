//
//  ApiPointConversion.swift
//  WardMax
//
//  Created by Edgar Zarco on 4/7/24.
//

import Foundation
struct ApiPointConversion : Codable {
    let id: Int?
    let creditCard: String?
    let pointsPerDollar: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case creditCard = "creditCard"
        case pointsPerDollar = "pointsPerDollar"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        creditCard = try values.decodeIfPresent(String.self, forKey: .creditCard)
        pointsPerDollar = try values.decodeIfPresent(Int.self, forKey: .pointsPerDollar)
    }
    
}
