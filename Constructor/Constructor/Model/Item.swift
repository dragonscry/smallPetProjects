//
//  Item.swift
//  Constructor
//
//  Created by Denys on 05.06.2022.
//

import SwiftUI

class Item: Identifiable {
    
    let id = UUID().uuidString
    var name : String
    var price : Int
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
}

extension Item: Hashable {
    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(price)
    }
}
