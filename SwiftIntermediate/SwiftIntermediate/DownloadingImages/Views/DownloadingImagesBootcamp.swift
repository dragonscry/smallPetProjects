//
//  DownloadingImagesBootcamp.swift
//  SwiftIntermediate
//
//  Created by Denys on 13.06.2022.
//

//Codable
//background threads
//weak self
//Combine
//Publishers and Subscribres
//FileManager
//NSCache

import SwiftUI

struct DownloadingImagesBootcamp: View {
    
    @StateObject var vm = DownloadingImagesViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.dataArray) { model in
                    Text(model.title)
                }
            }
            .navigationTitle("Downloading Images")
        }
    }
}

struct DownloadingImagesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImagesBootcamp()
    }
}
