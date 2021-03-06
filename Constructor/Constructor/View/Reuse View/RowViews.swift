//
//  RowViews.swift
//  Constructor
//
//  Created by Denys on 30.06.2022.
//

import SwiftUI

struct ItemRow: View {
    var item : ItemEntity
    
    var body: some View {
        HStack {
            Text(item.name ?? "")
            Spacer()
            Text(String(format: "%.2f", item.price))
        }
    }
}

struct ItemRowWithStepper: View {
    
    var item : ItemEntity
    var product: ProductEntity
    //@EnvironmentObject var coreDataVM: CoreDataRelationshipViewModel
    @EnvironmentObject var productVM: ProductsViewModel
    var itemCount: ItemCountEntity?
    @State var itemCountStr = ""
    
    var body: some View {
        VStack{
            HStack {
                Text(item.name ?? "")
                Spacer()
                Text(String(format: "%.2f", item.price))
            }
            HStack {
                Text("Count is")
                Spacer()
                TextField("", text: $itemCountStr) {
                    updateItemCount()
                    productVM.recalculationProduct(product: product)
                }
                .underlineTextField()
                Spacer()
                Text(item.dimension ?? "")
            }
        }
        .onAppear(perform: countFromItemCount)
    }
    
//    init(item: ItemEntity, product: ProductEntity) {
//        self.item = item
//        self.product = product
//    }
    
    func countFromItemCount() {
        self.itemCountStr = String(itemCount?.count ?? -1)
    }
    
    func updateItemCount() {
        let count: Float = Float(itemCountStr) ?? -1
        productVM.updateItemCount(itemCount: itemCount, count: count)
    }
    
    
//
//    func incrementStep() {
//        count += 1
//        if count >= 100 { count = 100 }
//        productVM.updateItemCount(itemCount: itemCount, count: count)
//        productVM.recalculationProduct(product: product)
//    }
//
//    func decrementStep() {
//        count -= 1
//        if count < 1 { count = 1 }
//        productVM.updateItemCount(itemCount: itemCount, count: count)
//        productVM.recalculationProduct(product: product)
//    }
    
    //TODO: change count and stepper to field!!! count now is float
}

//struct RowViews_Previews: PreviewProvider {
//    static var previews: some View {
//        RowViews()
//    }
//}
