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
    
    func saveItem(name: String, price: String) {
        let newItem = Item(name: name, price: Int(price) ?? 0)
        items.append(newItem)
    }
    
    init() {
        getItem()
    }
    
    func refresh() {
        let newItem = Item(name: "", price: 0)
        items.append(newItem)
        let index = items.firstIndex { item in
            item.id == newItem.id
        }
        guard let index = index else {return}
        items.remove(at: index)
    }
    
    
    
    func getItem(){
        items.append(Item(name: "Protocol", price: 10))
        items.append(Item(name: "Arbus", price: 20))
        items.append(Item(name: "Pilesos", price: 30))
        items.append(Item(name: "Lord", price: 20))
        items.append(Item(name: "Lord", price: 30))
    }
    
}
