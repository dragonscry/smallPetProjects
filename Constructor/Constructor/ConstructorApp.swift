//
//  ConstructorApp.swift
//  Constructor
//
//  Created by Denys on 23.05.2022.
//

import SwiftUI

@main
struct ConstructorApp: App {
    
    @StateObject var projectsVM: ProjectsViewModel = ProjectsViewModel()
    @StateObject var itemsVM: ItemsViewModel = ItemsViewModel()
    @StateObject var productsVM: ProductsViewModel = ProductsViewModel()
    
    var body: some Scene {
        WindowGroup {
            VStack {
                ContentView()
            }
            .environmentObject(projectsVM)
            .environmentObject(itemsVM)
            .environmentObject(productsVM)
        }
    }
}
