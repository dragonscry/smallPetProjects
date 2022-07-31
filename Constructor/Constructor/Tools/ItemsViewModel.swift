//
//  ItemsViewModel.swift
//  Constructor
//
//  Created by Denys on 16.07.2022.
//

import Foundation
import CoreData

class ItemsViewModel: ObservableObject {
    
    let manager = CoreDataManager.instance
    
    @Published var items: [ItemEntity] = [] //empty array with items
    
    init() {
        getItems()
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
    
    //add item to core NEED UPD
    func addItem(name: String, price: Float, description: String, dimension: String, project: ProjectEntity?) {
        
        guard let project = project else {
            print("Project is not selected")
            return
        }
        
        let newItem = ItemEntity(context: manager.context)
        newItem.itemID = UUID().uuidString
        newItem.name = name
        newItem.price = price
        newItem.dimension = dimension
        newItem.desc = description
        
        project.addToItems(newItem)
        
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
    
    func deleteItem2(item: ItemEntity) {
        manager.context.delete(item)
        save()
    }
    
    
    func save() {
        items.removeAll()
        self.manager.save()
        self.getItems()
    }
}
