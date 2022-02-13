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
    
    var body: some View {
        NavigationView {
            VStack{
                JokeView(joke: $joke)
                
                Spacer()
                
                Button(action: {
                    JokeAPI().getJoke(from: "https://v2.jokeapi.dev/joke/any", completion: {joke in
                        withAnimation {
                        self.joke = joke
                        }
                    })
                }){
                    Text("Get a joke")
                }
            }
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

