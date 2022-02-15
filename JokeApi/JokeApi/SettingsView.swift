//
//  SettingsView.swift
//  JokeApi
//
//  Created by Denys on 14.02.2022.
//

import SwiftUI

struct SettingsView: View {
    
    @State var categories : AllCategories?
    @Binding var currentCategory : String
    
    var body: some View {
        VStack {
            HStack {
                Text("Click on to select joke type: ")
                    Picker("Category", selection: $currentCategory) {
                        if categories != nil {
                            ForEach(categories!.categories, id: \.self) { category in
                                Text(category)
                            }
                        }

                    }.pickerStyle(.menu)
            }
        }.onAppear{
            JokeAPI().getCategories(from: "https://v2.jokeapi.dev/categories") { cats in
                self.categories = cats
                
            }
        }
    }
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
