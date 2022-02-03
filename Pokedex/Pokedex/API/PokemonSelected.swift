//
//  PokemonSelected.swift
//  Pokedex
//
//  Created by Denys on 01.02.2022.
//

import Foundation

//struct PokemonSelected: Codable {
//    var sprites: PokemonSprites
//    var weight: Int
//}
//
//struct PokemonSprites: Codable {
//    var front_default: String
//}
//
class PokemonSelectedApi {
    func getData(url: String, completion: @escaping (PokemonDetails)->()) {
        guard let url = URL(string: url) else {return}

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}

            let pokemonDetails = try! JSONDecoder().decode(PokemonDetails.self, from: data)

            DispatchQueue.main.async {
                completion(pokemonDetails)
            }
        }.resume()
    }
}
