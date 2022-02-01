//
//  ContentView.swift
//  Pokedex
//
//  Created by Denys on 01.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var pokemon = [PokemonEntry]()
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchText == "" ? pokemon : pokemon.filter({$0.name.contains(searchText.lowercased())
                })) { entry in
                    HStack {
                        PokemonImage(imageLink: "\(entry.url)")
                            .padding(.horizontal, 10)//PokemonImage
                        NavigationLink("\(entry.name)".capitalized,destination: Text("DetailView for \(entry.name)"))
                    }
                }
            }
            .onAppear{
                PokeApi().getData() { pokemon in
                    self.pokemon = pokemon
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Pokedex")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
