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
    
    //selected project property
    var selectedProject : ProjectEntity? {
        get {
            projects.first { project in
                project.isSelected == true
            }
        }
    }
    
    init() {
        getProjects()
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
    
    //add project to core
    func addProject(name: String) {
        self.unselectAllProject()
        let newProject = ProjectEntity(context: manager.context)
        newProject.projectID = UUID().uuidString
        newProject.name = name
        newProject.isSelected = true
        save()
    }
    
    //unselect all project
    func unselectAllProject() {
        for project in projects {
            project.isSelected = false
        }
        self.save()
    }
    
    //add item to core
    func addItem(name: String, price: Float) {
        let newItem = ItemEntity(context: manager.context)
        newItem.itemID = UUID().uuidString
        newItem.name = name
        newItem.price = price
        
        self.addItemToProject(item: newItem)
        
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
        
        self.addProductToProject(product: newProduct)
        
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
        
        self.addProductToProject(product: newProduct)
        
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
    
    func addProductToProject(product: ProductEntity) {
        guard let project = projects.first(where: { project in
            project.isSelected == true
        }) else {
            print("No selected projects")
            return
        }
        project.addToProducts(product)
    }
    
    func addItemToProject(item: ItemEntity) {
        guard let project = projects.first(where: { project in
            project.isSelected == true
        }) else {
            print("No selected projects")
            return
        }
        
        project.addToItems(item)
    }
    
    //update project entity
    func updateProject(project: ProjectEntity, name: String) {
        project.name = name
        save()
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
    
    //delete project and all conected items and products
    func deleteProject(at indexSet: IndexSet) {
        indexSet.forEach { index in
            let project = projects[index]
            
            //delete all connected products
            if let products = project.products?.allObjects as? [ProductEntity] {
                for product in products {
                    deleteProduct(product: product)
                }
            }
            
            //delete all connected items
            if let items = project.items?.allObjects as? [ItemEntity] {
                for item in items {
                    deleteItem(item: item)
                }
            }
            
            manager.context.delete(project)
        }
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
            deleteItemCounts(product: product)
            manager.context.delete(product)
        }
        save()
    }
    
    
    
    //delete specific item
    func deleteItem(item: ItemEntity) {
        manager.context.delete(item)
    }
    
    //delete specific product and all conected item counts
    func deleteProduct(product: ProductEntity) {
        deleteItemCounts(product: product)
        manager.context.delete(product)
    }
    
    //delete item counts from project
    func deleteItemCounts(product: ProductEntity) {
        if let itemCounts = product.itemCounts?.allObjects as? [ItemCountEntity] {
            for itemCount in itemCounts {
                manager.context.delete(itemCount)
            }
        }
    }
    
    //save to core and get all entitys
    func save() {
        
        projects.removeAll()
        products.removeAll()
        items.removeAll()
        itemsCount.removeAll()
        //
        //DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
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
       // }
        
    }
    
}

//MARK: TODO:
/*
 Maybe good reason to split all functionality
 */
