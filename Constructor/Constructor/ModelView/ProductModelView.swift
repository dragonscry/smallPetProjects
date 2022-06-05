//
//  ProductModelView.swift
//  Constructor
//
//  Created by Denys on 05.06.2022.
//

import SwiftUI
import Foundation

class ProductModelView : ObservableObject {
    
    @Published var products : [Product] = []
}
