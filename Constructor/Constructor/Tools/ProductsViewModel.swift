//
//  ProductsViewModel.swift
//  Constructor
//
//  Created by Denys on 16.07.2022.
//

import Foundation
import CoreData

class ProductsViewModel: ObservableObject {
    
    let manager = CoreDataManager.instance
    
    @Published var products: [ProductEntity] = [] //empty array with products
    //@Published var itemCounts: [ItemCountEntity] = [] //empty array with itemCounts
    
    init() {
        getProducts()
       // getItemCounts()
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
    
    //add products from core to array
//    func getItemCounts() {
//        let request = NSFetchRequest<ItemCountEntity>(entityName: "ItemCountEntity")
//        
//        do {
//            itemCounts = try manager.context.fetch(request)
//        } catch let error {
//            print("Error product fetching \(error.localizedDescription)")
//        }
//        
//    }
    
    //add product to project and to core
    func addProduct(name : String, project: ProjectEntity?) {
        
        guard let project = project else {
            print("Project is not selected")
            return
        }
        
        let newProduct = ProductEntity(context: manager.context)
        newProduct.productID = UUID().uuidString
        newProduct.name = name
        newProduct.items = []
        newProduct.isEditable = true
        newProduct.price = 0
        
        project.addToProducts(newProduct)
        
        save()
    }
    
    //add item count to core
    func addItemCount(item: ItemEntity, product: ProductEntity) {
        let newItemCount = ItemCountEntity(context: manager.context)
        newItemCount.idItem = item.itemID
        newItemCount.count = 1
        
        addItemCountToProduct(itemCount: newItemCount, product: product)
    }
    
    //add item count to product
    func addItemCountToProduct(itemCount: ItemCountEntity, product: ProductEntity) {
        product.addToItemCounts(itemCount)
    }
    
    //add product to core with items
    func addProduct(name : String, items: Set<ItemEntity>, project: ProjectEntity?) {
        
        guard let project = project else {
            print("Project is not selected")
            return
        }
        
        let newProduct = ProductEntity(context: manager.context)
        newProduct.productID = UUID().uuidString
        newProduct.name = name
        newProduct.isEditable = true
        let newItems = items as NSSet
        newProduct.items = newItems
        var price : Float = 0
        
        for item in items {
            addItemCount(item: item, product: newProduct)
            price += item.price
        }
        
        newProduct.price = price
        
        project.addToProducts(newProduct)
        
        save()
    }
    
    //add not editable product to core with price
    func addProduct(name: String, price: String, project: ProjectEntity?) {
        
        guard let project = project else {
            print("Project is not selected")
            return
        }
        
        let newProduct = ProductEntity(context: manager.context)
        newProduct.productID = UUID().uuidString
        newProduct.name = name
        newProduct.price = Float(price) ?? 0
        newProduct.isEditable = false
        
        project.addToProducts(newProduct)
        
        save()
        
        
    }
    
    //add item to product
    func addItemToProduct(item: ItemEntity, product: ProductEntity) {
        product.addToItems(item)
        save()
    }
    
    //add items to product
    func addItemsToProduct(items: Set<ItemEntity>, product: ProductEntity) {
        for item in items {
            addItemCount(item: item, product: product)
        }
        let items = items as NSSet
        product.addToItems(items)
        save()
    }
    
    //update product entity
    func updateProduct(product: ProductEntity, name: String) {
        product.name = name
        save()
    }
    
    //update not editable product
    func updateProduct(product: ProductEntity, name: String, price: String) {
        product.name = name
        product.price = Float(price) ?? 0
        save()
    }
    
    //update item count entity
    func updateItemCount(itemCount: ItemCountEntity?, count: Float) {
        
        guard let itemCount = itemCount else {return}
        
        itemCount.count = count
        save()
    }
    
    // delete product from core
    func deleteProduct(at indexSet: IndexSet) {
        indexSet.forEach { index in
            let product = products[index]
            deleteItemCounts(product: product)
            manager.context.delete(product)
        }
        save()
    }
    
    //delete item counts from project
    func deleteItemCounts(product: ProductEntity) {
        if let itemCounts = product.itemCounts?.allObjects as? [ItemCountEntity] {
            for itemCount in itemCounts {
                manager.context.delete(itemCount)
            }
        }
    }
    
    //delete specific product and all conected item counts
    func deleteProduct(product: ProductEntity) {
        deleteItemCounts(product: product)
        manager.context.delete(product)
        save()
    }
    
    func recalculationProduct(product: ProductEntity) {
        var s: Float = 0
        if let items = product.items?.allObjects as? [ItemEntity] {
            for i in 0..<items.count {
                s += items[i].price * Float(getItemCount(item: items[i], product: product)?.count ?? 1)
            }
        }
        product.price = s
        save()
    }
    
    //get item count which connected to item
    func getItemCount(item: ItemEntity, product: ProductEntity) -> ItemCountEntity? {
        
        if let itemCounts = product.itemCounts?.allObjects as? [ItemCountEntity] {
            let count = itemCounts.first { itemCount in
                itemCount.idItem == item.itemID
            }
            
            return count
        }
        
        return nil
    }
    
    
    func save() {
        products.removeAll()
        //itemCounts.removeAll()
        manager.save()
        getProducts()
        //getItemCounts()
    }
    
}
