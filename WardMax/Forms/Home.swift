//
//  Home.swift
//  WardMax
//
//  Created by Edgar Zarco on 4/7/24.
//

import SwiftUI

struct Home: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    
    var body: some View {
        VStack{
            
            Spacer()
            Image("WardMaxLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text("Ward").padding(.bottom, 10)
            Text("        Max").padding(.bottom, 10)
            Text("The Credit Card reward maximizer").padding(.bottom, 200)
            Text("2024 - DecaHex_")
            NavigationLink{
                Text("asd")
            } label: {
                Label("dsa", systemImage: "folder")
            }
            Spacer()
            List{
                Text("ads")
            }
            
//            Text("This is home page")
//            Button(action: {
//                Task{
//                    try await GetCardTest()
//                }
//            }){
//                Text("Get card")
//            }.foregroundColor(Color.black)
//            
//            Button(action: {
//                Task{
//                    try await WardMaxData().InitAppData()
//                }
//            }){
//                Text("Init store data")
//            }.foregroundColor(Color.black)
        }.frame(maxWidth: .infinity)
            .navigationTitle("Home")
        
    }
    
    func GetCardTest() async {
        do{
            var builtCard = Card(context: viewContext)
            var apiCard = try await WardMaxController().GetCardById(id: 6)
            print("Pulled apiCard")
            
            
            builtCard.id = UUID()
            builtCard.name = apiCard.name
            builtCard.network = apiCard.networkType?.name
            
            print("Coded card: \(builtCard.name!)")
            print("Network: \(builtCard.network!)")
            
        } catch {
            print("error getting card test \(error.localizedDescription)")
        }
    }
    
}

#Preview {
    Home()
}
