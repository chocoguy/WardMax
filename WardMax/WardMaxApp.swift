//
//  WardMaxApp.swift
//  WardMax
//
//  Created by Edgar Zarco on 4/3/24.
//

import SwiftUI

@main
struct WardMaxApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            let viewContext = PersistenceController.shared.persistentContainer.viewContext
            FormView()
                .environment(\.managedObjectContext, viewContext)
        }
    }
}
