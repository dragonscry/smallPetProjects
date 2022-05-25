//
//  DownloadWIthCombine.swift
//  SwiftIntermediate
//
//  Created by Denys on 25.05.2022.
//

import SwiftUI
import Combine

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithCombineViewModel: ObservableObject {
    @Published var posts: [PostModel] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        
        //Combine
        /*
        //1. create a publisher
        //2. subscribe publisher on background thread (dataTaskPublisher)
        //3. recieve on main thread
        //4. tryMap (check correct data)
        //5. decode (decode data into PostModels)
        //6. sink (put the item into our app
        //7. store(cancel subscription if needed)
         */
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
//            .tryMap { (data, response) -> Data in
//                guard
//                    let response = response as? HTTPURLResponse,
//                    response.statusCode >= 200 && response.statusCode < 300 else {
//                    throw URLError(.badServerResponse)
//                }
//                return data
//            }
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .sink(receiveValue: { [weak self] (returnedPosts) in
                self?.posts = returnedPosts
            })
//            .sink { (completion) in
//                switch completion {
//                case .finished:
//                    print("Finished")
//                case .failure(let error):
//                    print("There was an error. \(error)")
//
//                }
//            } receiveValue: { [weak self] (returnedPosts) in
//                self?.posts = returnedPosts
//            }
            .store(in: &cancellables)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}

struct DownloadWIthCombine: View {
    
    @StateObject var vm = DownloadWithCombineViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct DownloadWIthCombine_Previews: PreviewProvider {
    static var previews: some View {
        DownloadWIthCombine()
    }
}
