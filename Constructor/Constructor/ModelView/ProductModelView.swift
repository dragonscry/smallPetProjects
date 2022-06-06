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
    
    func saveProduct(name: String) {
        let newProduct = Product(name: name)
        products.append(newProduct)
    }
    
    func saveProduct(name: String, items: Set<Item>){
        let newProduct = Product(name: name, items: items)
        products.append(newProduct)
    }
}
