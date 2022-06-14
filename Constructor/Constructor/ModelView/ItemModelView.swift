//
//  ItemModelView.swift
//  Constructor
//
//  Created by Denys on 05.06.2022.
//

import SwiftUI
import Foundation

class ItemModelView : ObservableObject {
    
    @Published var items : [Item] = []
    
    //save item in list
    func saveItem(name: String, price: String) {
        let newItem = Item(name: name, price: Int(price) ?? 0)
        items.append(newItem)
    }
    
    init() {
        getItem()
    }
    
    //need to update list (need to refactor!!!)
    func refresh() {
        let newItem = Item(name: "", price: 0)
        items.append(newItem)
        let index = items.firstIndex { item in
            item.id == newItem.id
        }
        guard let index = index else {return}
        items.remove(at: index)
    }
    
    //update item in list
    func update(item: Item, name: String, price: Int) {
        let index = items.firstIndex { newItem in
            newItem.id == item.id
        }
        guard let index = index else {return}
        items[index].name = name
        items[index].price = price
    }
    
    
    
    func getItem(){
        items.append(Item(name: "Protocol", price: 10))
        items.append(Item(name: "Arbus", price: 20))
        items.append(Item(name: "Pilesos", price: 30))
        items.append(Item(name: "Lord", price: 20))
        items.append(Item(name: "Lord", price: 30))
    }
    
}
