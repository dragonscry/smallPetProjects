//
//  StockView.swift
//  Constructor
//
//  Created by Denys on 27.09.2022.
//

import SwiftUI

struct StockView: View {
    
    @EnvironmentObject var superVM: SuperViewModel
    
    @State private var itemToBasket = Set<ItemEntity>()
    
    var body: some View {
        VStack{
            
            HStack {
                Spacer()
                BasketView(count: itemToBasket.count, height: 30, width: 30)
            }
            .padding(.horizontal, 10)
            
            List {
                ForEach(superVM.items) { item in
                    HStack {
                        Text(item.name ?? "")
                        Spacer()
                        if itemToBasket.contains(item) {
                            Image(systemName: "heart.fill")
                        }
                        Text(item.storageCount.asString2Decimal())
                    }
                    .onTapGesture {
                        if !itemToBasket.contains(item){
                            itemToBasket.insert(item)
                        } else {
                            itemToBasket.remove(item)
                        }
                        

                    }
                }
            }
        }
    }
    
//    func itemEntityToItemModels() -> [ItemModel] {
//        var itemModel = [ItemModel]()
//        for item in superVM.items {
//            if let id = item.item {
//                itemModel.append(ItemModel(id: id))
//            }
//        }
//        return itemModel
//    }
}
//
//struct StockView_Previews: PreviewProvider {
//    static var previews: some View {
//        StockView()
//    }
//}

struct ItemModel: Codable, Hashable {
    let id: String
    var count = 0
}
