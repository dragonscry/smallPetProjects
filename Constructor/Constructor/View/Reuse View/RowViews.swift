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
    //@EnvironmentObject var coreDataVM: CoreDataRelationshipViewModel
    @EnvironmentObject var productVM: ProductsViewModel
    var itemCount: ItemCountEntity?
    
    @State var count = 1
    @Binding var sum: String
    
    var body: some View {
        VStack{
            HStack {
                Text(item.name ?? "")
                Spacer()
                Text(String(format: "%.2f", item.price))
            }
            HStack {
                Stepper {
                    Text("Count is: \(count)")
                } onIncrement: {
                    incrementStep()
                } onDecrement: {
                    decrementStep()
                }
            }
        }
        .onAppear(perform: countFromItemCount)
    }
    
//    init(item: ItemEntity, product: ProductEntity) {
//        self.item = item
//        self.product = product
//    }
    
    func countFromItemCount() {
        self.count = Int(itemCount?.count ?? -1)
    }
    
    func incrementStep() {
        count += 1
        if count >= 100 { count = 100 }
        productVM.updateItemCount(itemCount: itemCount, count: count)
        sum = String(format: "%.2f", (Float(sum) ?? 0) + item.price)
    }
    
    func decrementStep() {
        count -= 1
        if count < 1 { count = 1 }
        productVM.updateItemCount(itemCount: itemCount, count: count)
        sum = String(format: "%.2f", (Float(sum) ?? 0) - item.price)
    }
}

//struct RowViews_Previews: PreviewProvider {
//    static var previews: some View {
//        RowViews()
//    }
//}
