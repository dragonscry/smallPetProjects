//
//  ContentView.swift
//  Pokedex
//
//  Created by Denys on 01.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var pokemons = [PokemonEntry]()
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchText == "" ? pokemons : pokemons.filter({$0.name.contains(searchText.lowercased())
                })) { entry in
                    HStack {
                        Text("\(entry.name)")
                    }
                }
            }
            .onAppear{ if pokemons.isEmpty {
                PokeApi().getData(completion: {poke in self.pokemons = poke })
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
