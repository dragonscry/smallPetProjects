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
    @Published var itemCounts: [ItemCountEntity] = [] //empty array with itemCounts
    
    init() {
        getProducts()
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
        
        for item in items {
            addItemCount(item: item, product: newProduct)
        }
        
        project.addToProducts(newProduct)
        
        save()
    }
    
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
    
    func updateProduct(product: ProductEntity, name: String, price: String) {
        product.name = name
        product.price = Float(price) ?? 0
        save()
    }
    
    //update item count entity
    func updateItemCount(itemCount: ItemCountEntity?, count: Int) {
        
        guard let itemCount = itemCount else {return}
        
        itemCount.count = Int32(count)
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
    
    
    func save() {
        products.removeAll()
        itemCounts.removeAll()
        manager.save()
        getProducts()
    }
    
}
