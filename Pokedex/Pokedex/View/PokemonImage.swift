//
//  PokemonImage.swift
//  Pokedex
//
//  Created by Denys on 01.02.2022.
//

import SwiftUI

//struct PokemonImage: View {
//    
//    var imageLink = ""
//    @State private var pokemonSprite = ""
//    
//    var body: some View {
//        AsyncImage(url: URL(string: pokemonSprite))
//            .frame(width: 75, height: 75)
//            .onAppear {
//                let loadedData = UserDefaults.standard.string(forKey: imageLink)
//                
//                if loadedData == nil {
//                    getSprite(url: imageLink)
//                    UserDefaults.standard.set(imageLink, forKey: imageLink)
//                } else {
//                    getSprite(url: loadedData!)
//                }
//            }
//            .clipShape(Circle())
//            .foregroundColor(Color.gray.opacity(0.6))
//    }
//    
//    func getSprite(url: String) {
//        var tempSprite: String?
//        
//        PokemonSelectedApi().getData(url: url) { sprite in
//            tempSprite = sprite.front_default
//            self.pokemonSprite = tempSprite ?? "placeholder"
//        }
//    }
//}
//
//
//
//struct UrlImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        UrlImageView(urlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png")
//    }
//}

struct UrlImageView: View {
    
    @ObservedObject var urlImageModel : UrlImageModel
    
    init(urlString: String?) {
        urlImageModel = UrlImageModel(urlString: urlString)
    }
    
    var body: some View {
        Image(uiImage: urlImageModel.image ?? UrlImageView.defaultImage!)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
    }
    
    static var defaultImage = UIImage(named: "NewsIcon")
    
}

class UrlImageModel: ObservableObject {
    @Published var image: UIImage?
    var urlString: String?
    
    init(urlString: String?) {
        self.urlString = urlString
        loadImage()
    }
    
    func loadImage() {
        loadImageFromUrl()
    }
    
    func loadImageFromUrl() {
        guard let urlString = urlString else {
            return
        }
        
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: getImageFromResponse(data:response:error:))
        task.resume()

    }
    
    func getImageFromResponse(data: Data?, response: URLResponse?, error: Error?) {
        guard error == nil else {
            print("Error: \(error!)")
            return
        }
        
        guard let data = data else {
            print("No data found")
            return
        }
        
        DispatchQueue.main.async {
            guard let loadedImage = UIImage(data: data) else {
                return
            }
            
            self.image = loadedImage
        }
        
    }
}
