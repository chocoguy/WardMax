//
//  Search.swift
//  WardMax
//
//  Created by Edgar Zarco on 4/7/24.
//

import SwiftUI

struct Search: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var allCards: FetchedResults<Card>
    
    @State var _searchQuery: String = ""
    @State var _cardsExist = false
    
    var body: some View {
        VStack{
            if(_cardsExist){
                TextField(text: $_searchQuery){
                    Text("Search...")
                }.padding(.horizontal, 50)
                    .padding(.top, 5)
                    .autocorrectionDisabled(true)
                    .textFieldStyle(.roundedBorder)
                Spacer()
                NavigationLink{
                    Text("asd")
                } label: {
                    Label("dsa", systemImage: "folder")
                }
                Spacer()
            }else{
                Text("Add a card first! change")
            }
        }.frame(maxWidth: .infinity)
            .onAppear(){
                _cardsExist =  CardsExist()
            }
    }
    
    
    func CardsExist() -> Bool{
        if (allCards.count > 0){
            return true
        }
        return false
    }
    
}

#Preview {
    Search()
}
