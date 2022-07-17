//
//  ConstructorApp.swift
//  Constructor
//
//  Created by Denys on 23.05.2022.
//

import SwiftUI

@main
struct ConstructorApp: App {
    
    @StateObject var coreDataVM: CoreDataRelationshipViewModel = CoreDataRelationshipViewModel()
    @StateObject var projectsVM: ProjectsViewModel = ProjectsViewModel()
    @StateObject var itemsVM: ItemsViewModel = ItemsViewModel()
    
    var body: some Scene {
        WindowGroup {
            VStack {
                ContentView()
            }
            .environmentObject(coreDataVM)
            .environmentObject(projectsVM)
            .environmentObject(itemsVM)
        }
    }
}
