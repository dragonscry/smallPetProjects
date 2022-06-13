//
//  DownloadingImagesViewModel.swift
//  SwiftIntermediate
//
//  Created by Denys on 13.06.2022.
//

import Foundation

class DownloadingImagesViewModel: ObservableObject {
    
    @Published var dataArray: [PhotoModel] = []
    
    let dataService = PhotoModelDataService.instance
    
}
