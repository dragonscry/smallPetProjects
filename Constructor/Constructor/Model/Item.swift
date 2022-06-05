//
//  Item.swift
//  Constructor
//
//  Created by Denys on 05.06.2022.
//

import SwiftUI

struct Item: Hashable {
    let id = UUID().uuidString
    let name : String
    var price : Int
}
