//
//  ApiCashback.swift
//  WardMax
//
//  Created by Edgar Zarco on 4/7/24.
//

import Foundation
struct ApiCashback : Codable {
    let id : Int?
    let creditCard : String?
    let merchantType : ApiMerchantType?
    let cashBackPercent : Double?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case creditCard = "creditCard"
        case merchantType = "merchantType"
        case cashBackPercent = "cashBackPercent"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        creditCard = try values.decodeIfPresent(String.self, forKey: .creditCard)
        merchantType = try values.decodeIfPresent(ApiMerchantType.self, forKey: .merchantType)
        cashBackPercent = try values.decodeIfPresent(Double.self, forKey: .cashBackPercent)
    }

}
