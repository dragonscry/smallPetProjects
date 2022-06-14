//
//  PhotoModel.swift
//  SwiftIntermediate
//
//  Created by Denys on 13.06.2022.
//

import Foundation

struct PhotoModel: Identifiable, Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
