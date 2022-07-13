//
//  ContentView.swift
//  Constructor
//
//  Created by Denys on 23.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            ProjectListView()
                .tabItem {
                    Image(systemName: "display")
                }
            ItemListView()
                .tabItem {
                    Image(systemName: "suitcase")
                }
            ProductListView()
                .tabItem {
                    Image(systemName: "suitcase.cart")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
