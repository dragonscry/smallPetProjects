//
//  PhotoModelDataService.swift
//  SwiftIntermediate
//
//  Created by Denys on 13.06.2022.
//

import Foundation

class PhotoModelDataService {
    
    static let instance = PhotoModelDataService() //Singleton
    
    private init() {
        
    }
    
    func downloadData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {return}
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(<#T##transform: (Publishers.SubscribeOn<URLSession.DataTaskPublisher, DispatchQueue>.Output) throws -> T##(Publishers.SubscribeOn<URLSession.DataTaskPublisher, DispatchQueue>.Output) throws -> T#>)
                
                
    }
    
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}
