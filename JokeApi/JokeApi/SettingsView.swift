//
//  SettingsView.swift
//  JokeApi
//
//  Created by Denys on 14.02.2022.
//

import SwiftUI

struct SettingsView: View {
    
    @State var categories : AllCategories?
    
    var body: some View {
        VStack {
            
        }.onAppear{
            JokeAPI().getCategories(from: "https://v2.jokeapi.dev/categories") { cats in
                self.categories = cats
                
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
