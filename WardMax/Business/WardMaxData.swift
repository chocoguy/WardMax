//
//  WardMaxData.swift
//  WardMax
//
//  Created by Edgar Zarco on 4/7/24.
//

import Foundation
import CoreData

struct WardMaxData {

    
    let persistentController = PersistenceController.shared
    let viewContext = PersistenceController.shared.persistentContainer.viewContext
    
    func InitAppData() async {
        
        do{
            
            await ClearRecords(tableName: "Store")
            await ClearRecords(tableName: "SpendCategory")
            
            let(data, response) = try await URLSession.shared.data(from: URL(string: "http://localhost:5000/WardMax/merchanttype/all")!)
            let(data2, response2) = try await URLSession.shared.data(from: URL(string: "http://localhost:5000/WardMax/merchant/all")!)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw WardMaxController.NetworkError.badResponse
            }
            
            guard let response2 = response2 as? HTTPURLResponse, response.statusCode == 200 else {
                throw WardMaxController.NetworkError.badResponse
            }
            
            let retMerchantTypes = try JSONDecoder().decode([ApiMerchantType].self, from: data)
            let retMerchants = try JSONDecoder().decode([ApiMerchant].self, from: data2)
            
            for apiMerchantType in retMerchantTypes {
                var newSpendCat = SpendCategory(context: viewContext)
                newSpendCat.id = Int32(apiMerchantType.id!)
                newSpendCat.name = apiMerchantType.name
                newSpendCat.isStore = false
                try viewContext.save()
            }
            
            for apiMerchant in retMerchants {
                var newStore = Store(context: viewContext)
                newStore.id = Int32(apiMerchant.id!)
                newStore.spendCatId = Int32((apiMerchant.merchantType?.id)!)
                newStore.name = apiMerchant.name
                try viewContext.save()
            }
            
            print("Data initialized")
            
        }
        catch{
            let nsError = error as NSError
            fatalError("Error initializing app data \(nsError).\(nsError.userInfo)")
        }
        
    }
    
    func ClearRecords(tableName: String) async {
        do {
            let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: tableName)
            
            let ret = try viewContext.fetch(fetchReq)
            for gotten in ret {
                viewContext.delete(gotten as! NSManagedObject)
            }
            
            try viewContext.save()
            
        }
        catch{
            let nsError = error as NSError
            fatalError("Error clearing records \(nsError).\(nsError.userInfo)")
        }
    }
    
    
}
