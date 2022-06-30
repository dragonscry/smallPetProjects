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
    @EnvironmentObject var coreDataVM: CoreDataRelationshipViewModel
    var itemCount: ItemCountEntity?
    
    @State var count = 1
    
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
        coreDataVM.updateItemCount(itemCount: itemCount, count: count)
    }
    
    func decrementStep() {
        count -= 1
        if count < 1 { count = 1 }
        coreDataVM.updateItemCount(itemCount: itemCount, count: count)
    }
}

//struct RowViews_Previews: PreviewProvider {
//    static var previews: some View {
//        RowViews()
//    }
//}
