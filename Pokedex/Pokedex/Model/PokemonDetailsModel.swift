//
//  PokemonDetailsModel.swift
//  Pokedex
//
//  Created by Denys on 03.02.2022.
//

import Foundation

struct PokemonDetails: Codable {
    var id : Int
    var height: Int
    var name: String
    var weight: Int
    var sprites: PokemonSprites
}

struct PokemonSprites: Codable {
    var front_default: String
}


