//
//  CardsNewManual.swift
//  WardMax
//
//  Created by Edgar Zarco on 5/6/24.
//

import SwiftUI

struct CardsNewManual: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State private var cardAdvantage: String = ""
    @State private var cardColor: Color = Color(.sRGB, red: 0.84, green: 0.3, blue: 0.2)
    @State private var cardFtFee: Double = 0
    @State private var cardIsCashback: Bool = false
    @State private var cardName: String = ""
    @State private var cardNetwork: String = ""
    @State private var cardPointsPerDollar: Int16 = 0
    
    
    
    var body: some View {
        VStack{
            Spacer()
            ColorPicker("",selection: $cardColor)
            Button{
                print("Add the card now")
                var colorStr = "\(cardColor)"
            } label: {
                Text("Add")
            }
            //Name, Annual fee, FT fee, dropdown netowork and card type, advantage list add and remove feature, points per $
            TextField(text: $cardName, prompt: Text("required")){
                Text("Name")
            }
            TextField(value: $cardFtFee, format: .number){
                Text("FT Fee")
            }
            
        }.navigationTitle("Custom Card")
    }
}

#Preview {
    CardsNewManual()
}
