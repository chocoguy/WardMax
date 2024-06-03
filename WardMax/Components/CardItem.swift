//
//  CardItem.swift
//  WardMax
//
//  Created by Edgar Zarco on 4/7/24.
//

import SwiftUI


struct CardItem: View {
    
    var body: some View {
        HStack{
            VStack{
                Image("cc-amex").resizable().scaledToFit().frame(width: 50)
            }
            VStack{
                HStack{
                    Text("AMEX Blue Cash").font(.system(size: 13)).bold()
                    Spacer()
                }
                HStack{
                    Text("Cash Back").font(.system(size: 10))
                    Spacer()
                }
            }
            Spacer()
            VStack{
                Spacer()
                Text("Detail >").font(.system(size: 13)).italic()
                Spacer()
            }
        }
    }
}
