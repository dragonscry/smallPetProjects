//
//  API.swift
//  JokeApi
//
//  Created by Denys on 12.02.2022.
//

import Foundation

//https://v2.jokeapi.dev/categories - endpoint to recieve categories
//https://v2.jokeapi.dev/joke/any - endpoint to return any Joke

struct AllCategories : Codable {
    let categories : [String]
}

struct Joke: Codable {
    let joke: String?
    let setup: String?
    let delivery: String?
}



class JokeAPI {
    
    func getCategories(from url: String, completion: @escaping (AllCategories)-> ()) {
        guard let url = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            
            let categories = try! JSONDecoder().decode(AllCategories.self, from: data)
            
            DispatchQueue.main.async {
                completion(categories)
            }
            
        }.resume()
    }
    
    func getJoke(from url: String, completion: @escaping (Joke)-> ()){
        guard let url = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            
            let joke = try! JSONDecoder().decode(Joke.self, from: data)
            
            DispatchQueue.main.async {
                completion(joke)
            }
            
        }.resume()
    }
    
    
}


