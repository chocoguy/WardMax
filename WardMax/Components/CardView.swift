//
//  CardView.swift
//  WardMax
//
//  Created by Edgar Zarco on 6/2/24.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text("AMEX Blue Cash").font(.system(size: 20)).bold()
                    Spacer()
                }
                HStack{
                    Text("AMEX").font(.system(size: 12))
                    Spacer()
                }
            }
            HStack{
                AsyncImage(url: URL(string: "https://res.cloudinary.com/decahex/image/upload/v1712111901/cashback_bluecash_njhvoh.png")) { image in
                    image.resizable().scaledToFit().padding(.top, 10)
                } placeholder: {
                    ProgressView()
                }
                VStack{
                    Text("$0 Annual fee")
                    Text("0% FT Fee")
                    Text("126 points per $")
                }
            }
            HStack{
                VStack{
                    Image(systemName: "creditcard.fill")
                    Text("2%")
                }
                VStack{
                    Image(systemName: "creditcard.fill")
                    Text("1.5%")
                }
                VStack{
                    Image(systemName: "creditcard.fill")
                    Text("3%")
                }
            }
        }.navigationTitle("AMEX Blue Cash").padding(.leading, 10).padding(.trailing, 10)
        VStack{
            HStack{
                Text("Advantage").padding(.leading,10).padding(.top, 10).font(.system(size: 20)).bold()
                Spacer()
            }
                List{
                    Section(header: Text("Features")) {
                        Text("adv1")
                        Text("Asv2")
                    }
                }
        }
    }
}

#Preview {
    CardView()
}
