//
//  Cards.swift
//  WardMax
//
//  Created by Edgar Zarco on 4/7/24.
//

import SwiftUI

struct Cards: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var Cards: FetchedResults<Card>
    
    @State var _searchQuery: String = ""
    
    var body: some View {
        VStack{
            Spacer()
            TextField(text: $_searchQuery){
                Text("Search...")
            }.padding(.horizontal, 50)
                .padding(.top, 5)
                .autocorrectionDisabled(true)
                .textFieldStyle(.roundedBorder)
            NavigationLink{
                CardsNew()
            } label: {
                Text("Add card")
            }

            List {
                 Text("A List Item")
                 Text("A Second List Item")
                 Text("A Third List Item")
             }
        }.background(Color.black)
    }
    
    
    func InitAddCard(){
        
    }
    
}

#Preview {
    Cards()
}
