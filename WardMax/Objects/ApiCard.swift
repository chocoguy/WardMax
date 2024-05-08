//
//  ApiCard.swift
//  WardMax
//
//  Created by Edgar Zarco on 4/7/24.
//

import Foundation
struct ApiCard : Codable {
    let id : Int?
    let rewardType : ApiRewardType?
    let networkType : ApiNetworkType?
    let name : String?
    let ftFee : Double?
    let picture : String?
    let pictureRetina : String?
    let color : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case rewardType = "rewardType"
        case networkType = "networkType"
        case name = "name"
        case ftFee = "ftFee"
        case picture = "picture"
        case pictureRetina = "pictureRetina"
        case color = "color"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        rewardType = try values.decodeIfPresent(ApiRewardType.self, forKey: .rewardType)
        networkType = try values.decodeIfPresent(ApiNetworkType.self, forKey: .networkType)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        ftFee = try values.decodeIfPresent(Double.self, forKey: .ftFee)
        picture = try values.decodeIfPresent(String.self, forKey: .picture)
        pictureRetina = try values.decodeIfPresent(String.self, forKey: .pictureRetina)
        color = try values.decodeIfPresent(String.self, forKey: .color)
    }

}
