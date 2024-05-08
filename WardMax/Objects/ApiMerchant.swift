//
//  ApiMerchant.swift
//  WardMax
//
//  Created by Edgar Zarco on 4/7/24.
//

import Foundation
struct ApiMerchant : Codable {
    let id : Int?
    let merchantType : ApiMerchantType?
    let name : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case merchantType = "merchantType"
        case name = "name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        merchantType = try values.decodeIfPresent(ApiMerchantType.self, forKey: .merchantType)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }

}
