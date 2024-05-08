//
//  CardsNew.swift
//  WardMax
//
//  Created by Edgar Zarco on 4/7/24.
//

import SwiftUI
import Foundation
import CoreData

//class TextFieldObserver : ObservableObject {
//    
//    @Published var debouncedText = ""
//    @Published var searchText = ""
//        
//    init(delay: DispatchQueue.SchedulerTimeType.Stride) {
//        $searchText
//            .debounce(for: delay, scheduler: DispatchQueue.main)
//            .assign(to: &$debouncedText)
//        print("Fetch apiu")
//        
//    }
//}

//debounce delay is being dumb... if the search query is greater than 3 characters then search and keep searching

struct CardsNew: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var cardsOwned: FetchedResults<Card>
//    @StateObject var textObserver = TextFieldObserver(delay: 1)
    
    @State var customText = ""
    
    @State var _searchQuery: String = ""
    @State var willSearch: Bool = true
    @State private var _queriedCreditCards: [ApiCard] = []
    


    
    var body: some View {
        VStack{
            Spacer()
            TextField(text: $_searchQuery){
                Text("Search...")
            }.padding(.horizontal, 50)
                .padding(.top, 5)
                .autocorrectionDisabled(true)
                .textFieldStyle(.roundedBorder)
                .onChange(of: _searchQuery) {oldQuery, newQuery in
                    Task{
                        if(newQuery.count >= 3){
                            await searchCards(query: newQuery)
                        }
                    }
                }
            NavigationLink{
                Cards()
            } label: {
                Text("Add Manual")
            }
            List{
                ForEach(_queriedCreditCards, id: \.self.id){cc in
                    ApiCardItem(apiCard: cc).onTapGesture {
                        Task{
                            await addCard(selectedCard: cc)
                        }
                    }
                }
            }
                
        }
    }
    
    
     func searchCards(query: String) async  {
         
         print("Will search: \(query)")
         _queriedCreditCards.removeAll()
         do{
             var queryResult = try await WardMaxController().SearchCards(query: query)
             _queriedCreditCards = queryResult
         }
         catch{
             print("Error searching cards \(error.localizedDescription)")
         }
         //DispatchQueue.main.suspend()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
//            if(willSearch != false){
//                willSearch = false
//                print(_searchQuery)
//            }
//        }
    }
    
    
    func addCard(selectedCard: ApiCard) async {
        do{
            for ownedCard in cardsOwned {
                if(ownedCard.name == selectedCard.name){
                    print("Card already added!")
                    return
                }
            }
            
            
            var newCard = Card(context: viewContext)
            newCard.id = UUID()
            newCard.color = selectedCard.color
            newCard.ftFee = selectedCard.ftFee!
            newCard.name = selectedCard.name
            newCard.network = selectedCard.networkType?.name
            newCard.picture = URL(string: selectedCard.picture!)
            newCard.advantage = ""
            if(selectedCard.rewardType?.name == "Points"){
                //points per dollar api call
                var pointQueryResult = try await WardMaxController().GetPointConversionByCardId(id: selectedCard.id!)
                var pointConversion : ApiPointConversion = pointQueryResult
                newCard.pointsForDollar = Int16(pointConversion.pointsPerDollar!)
                newCard.isCashback = false
            }else{
                newCard.isCashback = true
            }
            
            try viewContext.save()
            print("Saved card")
            
        }
        catch{
            print("Error adding card \(error.localizedDescription)")
        }
    }
    

    
    
}

#Preview {
    CardsNew()
}
