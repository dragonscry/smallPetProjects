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
    
    @Published var products: [ProductEntity] = [] //empty array with products
    @Published var items: [ItemEntity] = [] //empty array with items
    
    init() {
        getItems()
        getProducts()
    }
    
    //add items from core to array
    func getItems() {
        let request = NSFetchRequest<ItemEntity>(entityName: "ItemEntity")
        
        do {
            items = try manager.context.fetch(request)
        } catch let error {
            print("Error product fetching \(error.localizedDescription)")
        }
        
    }
    
    //add products from core to array
    func getProducts() {
        let request = NSFetchRequest<ProductEntity>(entityName: "ProductEntity")
        
        do {
            products = try manager.context.fetch(request)
        } catch let error {
            print("Error product fetching \(error.localizedDescription)")
        }
        
    }
    
    //add item to core
    func addItem(name: String, price: Float) {
        let newItem = ItemEntity(context: manager.context)
        newItem.id = UUID().uuidString
        newItem.name = name
        newItem.price = price
        save()
    }
    
    //add product to core without items
    func addProduct(name : String) {
        let newProduct = ProductEntity(context: manager.context)
        newProduct.id = UUID().uuidString
        newProduct.name = name
        newProduct.items = []
        save()
    }
    
    //add product to core with items
    func addProduct(name : String, items: Set<ItemEntity>) {
        let newProduct = ProductEntity(context: manager.context)
        newProduct.id = UUID().uuidString
        newProduct.name = name
        let newItems = items as NSSet
        newProduct.items = newItems
        save()
    }
    
    //add item to product
    func addItemToProduct(item: ItemEntity, product: ProductEntity) {
        product.addToItems(item)
        save()
    }
    
    //update item entity
    func updateItem(item: ItemEntity, name: String, price: Float) {
        item.name = name
        item.price = price
        save()
    }
    
    //delete item from core
    func deleteItem(at indexSet: IndexSet) {
        indexSet.forEach { index in
            let item = items[index]
            manager.context.delete(item)
        }
        save()
    }
   
    // delete product from core
    func deleteProduct(at indexSet: IndexSet) {
        indexSet.forEach { index in
            let product = products[index]
            manager.context.delete(product)
        }
        save()
    }
    
    //save to core and get all entitys
    func save() {
        
        products.removeAll()
        items.removeAll()
//
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.manager.save()
            self.getItems()
            self.getProducts()
        }

    }
    
}
