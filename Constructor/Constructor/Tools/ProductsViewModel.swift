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
    }
    
}
