//
//  ProductDetailsView.swift
//  Constructor
//
//  Created by Denys on 17.06.2022.
//

import SwiftUI

struct ProductDetailsView: View {
    
    let entity: ProductEntity
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var coreDataVM: CoreDataRelationshipViewModel
    @State var name = ""
    @State var sum = 0
    
    var body: some View {
        VStack {
            Text(entity.name ?? "Unnamed Product")
            
            if let items = entity.items?.allObjects as? [ItemEntity] {
                ForEach(items){ item in
                    HStack {
                        Text(item.name ?? "")
                        Text("\(item.price)")
                    }
                }
            }
            
            Text("Total: \(sum)")
        }
    }
}

//struct ProductDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailsView()
//    }
//}
