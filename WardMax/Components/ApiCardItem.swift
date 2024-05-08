//
//  ApiCardItem.swift
//  WardMax
//
//  Created by Edgar Zarco on 4/16/24.
//

import SwiftUI

struct ApiCardItem: View {
    
    @State var apiCard: ApiCard
    
    var body: some View {
        HStack{
            switch (apiCard.networkType!.id)
            {
            case 1:
                Image("cc-visa")
            case 2:
                Image("cc-mastercard")
            case 3:
                Image("cc-discover")
            case 4:
                Image("cc-amex")
            default:
                Image("cc-generic")
            }
            
            VStack{
                Text(apiCard.name!).bold()
                if(apiCard.rewardType!.id == 1){
                    Text("Cash Back").fontWeight(Font.Weight.light)
                }else{
                    Text("Points").fontWeight(Font.Weight.light)
                }
            }
            
            Spacer()
            
            Text("Add +")
            
        }
    }
}

