//
//  ConstructorApp.swift
//  Constructor
//
//  Created by Denys on 23.05.2022.
//

import SwiftUI

@main
struct ConstructorApp: App {
    
    @ObservedObject var itemMV: ItemModelView = ItemModelView()
    @ObservedObject var productMV: ProductModelView = ProductModelView()
    
    var body: some Scene {
        WindowGroup {
            VStack {
                ContentView()
            }
            .environmentObject(itemMV)
            .environmentObject(productMV)
        }
    }
}
