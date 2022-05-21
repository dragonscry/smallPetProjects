//
//  CoreDataBootcampApp.swift
//  CoreDataBootcamp
//
//  Created by Denys on 20.05.2022.
//

import SwiftUI

@main
struct CoreDataBootcampApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
