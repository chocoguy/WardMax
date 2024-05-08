//
//  Converters.swift
//  WardMax
//
//  Created by Edgar Zarco on 4/7/24.
//

import Foundation


struct Converters{
    func BuildCard(apiCard: ApiCard, card: Card) -> Card {
        card.id = UUID()
        card.advantage = ""
        card.color = apiCard.color
        card.ftFee = apiCard.ftFee!
        card.isCashback = apiCard.rewardType?.name == "Points" ? false : true
        card.name = apiCard.name
        card.network = apiCard.networkType?.name
        card.picture = URL(string: apiCard.picture!)
        
        switch card.network {
        case "Master Card":
            card.networkPicture = "cc-mastercard"
        case "American Express":
            card.networkPicture = "cc-amex"
        case "Visa":
            card.networkPicture = "cc-visa"
        case "Discover":
            card.networkPicture = "cc-discover"
         default:
            card.networkPicture = "cc-generic"
        }
        
        return card
    }
    
    
    func BuildCardRate(apiCashback: ApiCashback, apiPoints: ApiPoints, cardRate: CardRate) -> CardRate {
        
        cardRate.id = UUID()
        if(apiCashback == nil){
            cardRate.cashPointRate = Double(apiPoints.pointsx!)
        }else{
            cardRate.cashPointRate = apiCashback.cashBackPercent!
        }
        
        return cardRate
    }
    
}
