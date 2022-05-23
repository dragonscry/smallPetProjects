//
//  ConstructorApp.swift
//  Constructor
//
//  Created by Denys on 23.05.2022.
//

import SwiftUI

@main
struct ConstructorApp: App {
    
    @State var constructorModelView : ConstructorModelView = ConstructorModelView()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(constructorModelView)
        }
    }
}
