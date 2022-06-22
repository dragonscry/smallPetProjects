//
//  CoreDataViewModel.swift
//  Constructor
//
//  Created by Denys on 17.06.2022.
//

import Foundation
import CoreData

class CoreDataRelationshipViewModel : ObservableObject {
    
    let manager = CoreDataManager.instance
    
    @Published var products: [ProductEntity] = []
    @Published var items: [ItemEntity] = []
    
    init() {
        getItems()
        getProducts()
    }
    
    func getItems() {
        let request = NSFetchRequest<ItemEntity>(entityName: "ItemEntity")
        
        do {
            items = try manager.context.fetch(request)
        } catch let error {
            print("Error product fetching \(error.localizedDescription)")
        }
        
    }
    
    func getProducts() {
        let request = NSFetchRequest<ProductEntity>(entityName: "ProductEntity")
        
        do {
            products = try manager.context.fetch(request)
        } catch let error {
            print("Error product fetching \(error.localizedDescription)")
        }
        
    }
    
    func addItem(name: String, price: Float) {
        let newItem = ItemEntity(context: manager.context)
        newItem.name = name
        newItem.price = price
        save()
    }
    
    func addProduct(name : String) {
        let newProduct = ProductEntity(context: manager.context)
        newProduct.name = name
        newProduct.items = []
        save()
    }
    
    func addProduct(name : String, items: Set<ItemEntity>) {
        let newProduct = ProductEntity(context: manager.context)
        newProduct.name = name
        let newItems = items as NSSet
        newProduct.items = newItems
        save()
    }
    
    func addItemToProduct(item: ItemEntity, product: ProductEntity) {
        product.addToItems(item)
        save()
    }
    
    func updateItem(item: ItemEntity, name: String, price: Float) {
        item.name = name
        item.price = price
        save()
    }
    
    func deleteItem(item: ItemEntity) {
//        for index in offsets {
//            let item = 
//        }
        manager.context.delete(item)
        save()
    }
    
    func save() {
        manager.save()
        getItems()
        getProducts()
    }
    
}
