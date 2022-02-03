//
//  PokemonDetailsView.swift
//  Pokedex
//
//  Created by Denys on 03.02.2022.
//

import SwiftUI

struct PokemonDetailsView: View {
    var link : String
   @State var pokemonDetails : PokemonDetails?
    
    var body: some View {
        VStack{
            if let pokemon = pokemonDetails {
                VStack {
                    AsyncImage(url: URL(string: pokemon.sprites.front_default))
                    Text("ID: \(pokemon.id)")
                    Text("Name: \(pokemon.name.capitalized)")
                    Text("Heigt: \(pokemon.height)")
                    Text("Weight: \(pokemon.weight)")
                }
            }
        }
        .onAppear {
            PokemonSelectedApi().getData(url: link) { pokemon in
                self.pokemonDetails = pokemon
            }
        }
    }
}

//struct PokemonDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonDetailsView()
//    }
//}
