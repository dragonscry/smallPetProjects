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
    @Published var itemsCount: [ItemCountEntity] = [] //empty array with itemCounts
    @Published var projects: [ProjectEntity] = [] //empty array with projects
    
    init() {
        getItemsCount()
        getItems()
        getProducts()
    }
    
    //add projects from core to array
    func getProjects() {
        let request = NSFetchRequest<ProjectEntity>(entityName: "ProjectEntity")
        
        do {
            projects = try manager.context.fetch(request)
        } catch let error {
            print("Error product fetching \(error.localizedDescription)")
        }
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
    
    //add items from core to array
    func getItemsCount() {
        let request = NSFetchRequest<ItemCountEntity>(entityName: "ItemCountEntity")
        
        do {
            itemsCount = try manager.context.fetch(request)
        } catch let error {
            print("Error product fetching \(error.localizedDescription)")
        }
        
    }
    
    func addProject(name: String) {
        let newProject = ProjectEntity(context: manager.context)
        newProject.projectID = UUID().uuidString
        newProject.name = name
        newProject.isSelected = true
        save()
    }
    
    //add item to core
    func addItem(name: String, price: Float) {
        let newItem = ItemEntity(context: manager.context)
        newItem.itemID = UUID().uuidString
        newItem.name = name
        newItem.price = price
        save()
    }
    
    //add item count to core
    func addItemCount(item: ItemEntity, product: ProductEntity) {
        let newItemCount = ItemCountEntity(context: manager.context)
        newItemCount.idItem = item.itemID
        newItemCount.count = 1
        
        addItemCountToProduct(itemCount: newItemCount, product: product)
    }
    
    //add product to core without items
    func addProduct(name : String) {
        let newProduct = ProductEntity(context: manager.context)
        newProduct.productID = UUID().uuidString
        newProduct.name = name
        newProduct.items = []
        save()
    }
    
    //add product to core with items
    func addProduct(name : String, items: Set<ItemEntity>) {
        let newProduct = ProductEntity(context: manager.context)
        newProduct.productID = UUID().uuidString
        newProduct.name = name
        let newItems = items as NSSet
        newProduct.items = newItems
        
        for item in items {
            addItemCount(item: item, product: newProduct)
        }
        
        save()
    }
    
    //add item to product
    func addItemToProduct(item: ItemEntity, product: ProductEntity) {
        product.addToItems(item)
        save()
    }
    
    //add item count to product
    func addItemCountToProduct(itemCount: ItemCountEntity, product: ProductEntity) {
        product.addToItemCounts(itemCount)
    }
    
    //update item entity
    func updateItem(item: ItemEntity, name: String, price: Float) {
        item.name = name
        item.price = price
        save()
    }
    
    //update product entity
    func updateProduct(product: ProductEntity, name: String) {
        product.name = name
        save()
    }
    
    //update item count entity
    func updateItemCount(itemCount: ItemCountEntity?, count: Int) {
        
        guard let itemCount = itemCount else {return}
        
        itemCount.count = Int32(count)
        //save()
        manager.save()
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
            if let itemCounts = product.itemCounts?.allObjects as? [ItemCountEntity] {
                for itemCount in itemCounts {
                    manager.context.delete(itemCount)
                }
            }
            manager.context.delete(product)
        }
        save()
    }
    
    //save to core and get all entitys
    func save() {
        
        projects.removeAll()
        products.removeAll()
        items.removeAll()
        itemsCount.removeAll()
        //
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.manager.save()
            self.getItems()
            self.getProducts()
            self.getItemsCount()
            self.getProjects()
//            print("ItemsCount count is : \(self.itemsCount.count)")
//            print("Item Count is : \(self.items.count)")
//
//            for product in self.products {
//                print("product name is \(String(describing: product.name))")
//                if let itemCounts = product.itemCounts?.allObjects as? [ItemCountEntity] {
//                    print (itemCounts.count)
//                    for itemC in itemCounts {
//                        print("item count id \(String(describing: itemC.idItem))")
//                    }
//                }
//            }
        }
        
    }
    
}
