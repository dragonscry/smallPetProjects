//
//  AsyncImageBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 26.04.2022.
//

import SwiftUI

/*
 case empty - No image is loaded
 case success(Image) - image is loaded
 case failure(error) - image is failed to load
 */

struct AsyncImageBootcamp: View {
    
    let url = URL(string: "https://picsum.photos/400")
    
    var body: some View {
        //        AsyncImage(url: url, content: { returnedImage in
        //            returnedImage
        //                .resizable()
        //                .frame(width: 100, height: 100)
        //                .scaledToFit()
        //                .cornerRadius(20)
        //        }, placeholder: {
        //            ProgressView()
        //        })
        
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty :
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .frame(width: 100, height: 100)
                    .scaledToFit()
                    .cornerRadius(20)
            case .failure(let error):
                Image(systemName: "questionmark")
                    .font(.headline)
            default:
                Image(systemName: "questionmark")
                    .font(.headline)
            }
        }
        
    }
}

struct AsyncImageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageBootcamp()
    }
}
