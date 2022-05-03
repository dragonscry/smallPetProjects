//
//  swiftfulMapAppApp.swift
//  swiftfulMapApp
//
//  Created by Denys on 30.04.2022.
//

import SwiftUI

@main
struct swiftfulMapAppApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
