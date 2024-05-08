//
//  ApiCardOffer.swift
//  WardMax
//
//  Created by Edgar Zarco on 4/7/24.
//

import Foundation
struct ApiCardOffer : Codable {
    let id : Int?
    let creditCard : String?
    let offerTitle : String?
    let offerDescription : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case creditCard = "creditCard"
        case offerTitle = "offerTitle"
        case offerDescription = "offerDescription"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        creditCard = try values.decodeIfPresent(String.self, forKey: .creditCard)
        offerTitle = try values.decodeIfPresent(String.self, forKey: .offerTitle)
        offerDescription = try values.decodeIfPresent(String.self, forKey: .offerDescription)
    }

}
