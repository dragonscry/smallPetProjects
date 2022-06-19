//
//  DownloadingImagesRow.swift
//  SwiftIntermediate
//
//  Created by Denys on 19.06.2022.
//

import SwiftUI

struct DownloadingImagesRow: View {
    
    let model: PhotoModel
    
    var body: some View {
        HStack {
            Circle().frame(width: 75, height: 75)
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.headline)
                Text(model.url)
                    .foregroundColor(.gray)
                    .italic()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct DownloadingImagesRow_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImagesRow(model: PhotoModel(albumId: 1, id: 1, title: "Title", url: "url", thumbnailUrl: "thumb url"))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
