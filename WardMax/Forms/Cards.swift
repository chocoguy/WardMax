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
    @State private var ShowCardDetails: Bool = false
    @State private var SelectedCard: Card = Card()
    
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
                CardItem().swipeActions(allowsFullSwipe: false){
                    Button{
                        initEditCard()
                    } label : {
                        Label("Edit", systemImage: "pencil.line")
                    }.tint(.blue)
                    
                    Button{
                        initDeleteCard()
                    } label: {
                        Label("Delete", systemImage: "trash.fill")
                    }.tint(.red)
                }.onTapGesture {
                    ShowCardDetails = true
                }
                 Text("A Second List Item")
                 Text("A Third List Item")
             }
        }.background(Color.black)
            .sheet(isPresented: $ShowCardDetails){
                CardView()
                    .ignoresSafeArea()
                    .navigationTitle("Card")
                    .navigationBarTitleDisplayMode(.automatic)
            }
    }
    
    func initViewCardDetails(){
        
    }
    
    func initAddCard(){
        print("Add card")
    }
    
    func initEditCard(){
        print("Edit card")
    }
    
    func initDeleteCard(){
        print("Delete card")
    }
    
    
}
