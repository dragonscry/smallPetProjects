//
//  Product.swift
//  Constructor
//
//  Created by Denys on 05.06.2022.
//

import SwiftUI

struct Product: Hashable {
    let id = UUID().uuidString
    var name: String
    var items: [Item]
    var price: Int {
        get {
            totalPrice()
        }
    }
    
    init(name: String) {
        self.name = name
        self.items = []
    }
    
    func totalPrice() -> Int {
        if self.items.isEmpty {
            return 0
        }
        else {
            var sum = 0
            for item in self.items {
                sum += item.price
            }
            return sum
        }
    }
}
