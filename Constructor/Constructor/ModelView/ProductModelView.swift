//
//  ProductModelView.swift
//  Constructor
//
//  Created by Denys on 05.06.2022.
//

import SwiftUI
import Foundation

class ProductModelView : ObservableObject {
    
    let itemsKey: String = "produc_list"
    @Published var products : [Product] = [] {
        didSet {
            saveToJSON()
        }
    }
    
    
    
    init() {
        getDataFromJSON()
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
    
    func saveToJSON() {
        
        if let encodedData = try? JSONEncoder().encode(products) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
        
    }
    
    
    func getDataFromJSON() {
//        guard let filePath = Bundle.main.url(forResource: fileName, withExtension: nil) else {
//            fatalError("No file \(fileName) in directory")
//        }
//        let data = try! Data(contentsOf: filePath)
//        let decoder = JSONDecoder()
//        guard let items = try? decoder.decode([Item].self, from: data) else {return}
//        self.items = items
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([Product].self, from: data)
        else { return }
        
        self.products = savedItems
    }
}
