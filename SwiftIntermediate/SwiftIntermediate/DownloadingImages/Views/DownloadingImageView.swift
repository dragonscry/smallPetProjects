//
//  DownloadingImageView.swift
//  SwiftIntermediate
//
//  Created by Denys on 19.06.2022.
//

import SwiftUI

struct DownloadingImageView: View {
    
    @StateObject var loader = ImageLoadingViewModel()
    
    var body: some View {
        ZStack {
            if loader.isLoading {
                ProgressView()
            } else if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .clipShape(Circle())
            }
        }
    }
}

struct DownloadingImageView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImageView()
            .frame(width: 75, height: 75)
            .previewLayout(.sizeThatFits)
    }
}
