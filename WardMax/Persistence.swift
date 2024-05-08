//
//  Persistence.swift
//  WardMax
//
//  Created by Edgar Zarco on 4/3/24.
//

import CoreData

struct PersistenceController {
    let persistentContainer: NSPersistentContainer
    static let shared = PersistenceController()
    
    init(inMemory: Bool = false){
        persistentContainer = NSPersistentContainer(name: "WardMax")
        print(persistentContainer.persistentStoreDescriptions.first?.url ?? "Location not found!")
        
        if inMemory {
            persistentContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
                persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
    }
    
}
