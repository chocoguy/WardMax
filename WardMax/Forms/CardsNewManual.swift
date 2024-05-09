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
    @State private var cardCashbackValue: String = "Cash Back"
    @State private var cardIsCashback: Bool = true
    @State private var cardName: String = ""
    @State private var cardNetwork: String = ""
    @State private var cardPointsPerDollar: Int16 = 0
    
    @State private var cardAdvantageEditValue: String = ""
    @State private var cardAdvantageValues: [CardAdvantage] = []
    
    //Dynamic island when?
    
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
            
            Picker("Network", selection: $cardNetwork){
                Text("Master Card").tag("Master Card")
                Text("Visa").tag("Visa")
                Text("AMEX").tag("American Express")
                Text("Discover").tag("Discover")
            }.padding(.horizontal, 50)
            
            Picker("Reward Type", selection: $cardCashbackValue){
                Text("Cash Back").tag("Cash Back")
                Text("Points").tag("Points")
            }.padding(.horizontal, 50)
            
            if(cardCashbackValue == "Points"){
                TextField(value: $cardPointsPerDollar, format: .number){
                    Text("Points per $")
                }
            }
            
            
            Text("Card Advantage")
            TextField(text: $cardName){
                Text("add Advantage...")
            }
            Button{
                print("add advantage action")
            } label: {
                Text("Add")
            }
            
            List(cardAdvantageValues, id: \.self.id){ adv in
                Text(adv.advantage).swipeActions{
                    Button("Delete", role: .destructive){
                        print("Delete dis")
                    }
                }
            }
            
            
            
        }.navigationTitle("Custom Card")
    }
    
    func addCard() async {
        do {
            var newCard = Card(context: viewContext)
            newCard.id = UUID()
            
        }
        catch {
            print("Error adding manual card \(error.localizedDescription)")
        }
    }
    
    func addAdvantage() {
        
    }
    
    func removeAdvantage() {
        
    }
    
    
    
}

#Preview {
    CardsNewManual()
}
