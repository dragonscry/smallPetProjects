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
    
    init() {
        
    }
    
    func refresh() {
        let newItem = Product(name: "")
        products.append(newItem)
        let index = products.firstIndex { item in
            item.id == newItem.id
        }
        guard let index = index else {return}
        products.remove(at: index)
    }
    
    //If we want to save product only with name
    func saveProduct(name: String) {
        let newProduct = Product(name: name)
        products.append(newProduct)
    }
    
    //If we want to save product with products
    func saveProduct(name: String, items: Set<Item>){
        let newProduct = Product(name: name, items: items)
        products.append(newProduct)
    }
}
