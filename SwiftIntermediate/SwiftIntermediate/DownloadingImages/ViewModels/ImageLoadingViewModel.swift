//
//  ImageLoadingViewModel.swift
//  SwiftIntermediate
//
//  Created by Denys on 19.06.2022.
//

import Foundation
import SwiftUI

class ImageLoadingViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    
    
    func downloadImage() {
        guard let url = URL(string: "") else {return}
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map {UIImage(data: $0.data)}
//            .map { (data, response) -> UIImage? in
//                return UIImage(data: data)
//            }
            .receive(on: DispatchQueue.main)
            .sink { (_) in
                //
            } receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
            }

    }
    
}
