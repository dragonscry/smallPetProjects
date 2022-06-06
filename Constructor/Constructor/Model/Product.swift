//
//  Product.swift
//  Constructor
//
//  Created by Denys on 05.06.2022.
//

import SwiftUI

struct Product: Identifiable {
    let id = UUID().uuidString
    var name: String
    var items: [Item:Int]
    var price: Int {
        get {
            totalPrice()
        }
    }
    
    init(name: String) {
        self.name = name
        self.items = [:]
    }
    
    init(name: String, items: Set<Item>){
        self.name = name
        self.items = [:]
        itemsFromSet(items: items)
    }
    
    mutating func itemsFromSet(items: Set<Item>){
        for item in items {
            self.items[item] = 1
        }
    }
    
    func totalPrice() -> Int {
        if self.items.isEmpty {
            return 0
        }
        else {
            var sum = 0
            for (item, count) in self.items {
                sum += item.price * count
            }
            return sum
        }
    }
}
