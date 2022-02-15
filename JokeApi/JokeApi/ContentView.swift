//
//  ContentView.swift
//  JokeApi
//
//  Created by Denys on 11.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var categories : AllCategories?
    @State var joke: Joke?
    
    @State var isSettingsOn = false
    @State var currentCategory = "Any"
    
    var url : String {
        "https://v2.jokeapi.dev/joke/" + currentCategory.lowercased()
    }
    
    var body: some View {
        NavigationView {
            VStack{
                JokeView(joke: $joke)
                
                Spacer()
                Text("Your current category is: \(currentCategory)").fontWeight(.bold)
                    .padding()
                Button(action: {
                    JokeAPI().getJoke(from: url, completion: {joke in
                        withAnimation {
                        self.joke = joke
                        }
                    })
                }){
                    Text("Get a joke")
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .clipShape(Capsule())
            }
            .sheet(isPresented: $isSettingsOn){
                SettingsView(currentCategory: $currentCategory)
            }
            .navigationBarItems(trailing: Button(action: {
                isSettingsOn = true
            }){
                Image(systemName: "gear")
            })
            .padding(.vertical, 30)
            .navigationTitle(Text("Jokes"))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

