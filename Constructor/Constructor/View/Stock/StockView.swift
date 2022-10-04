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
                basket
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

extension StockView {
    
    var basket: some View {
        ZStack {
            Image(systemName: "cart")
                .resizable()
                .scaledToFit()
            if itemToBasket.count > 0 {
            Text("\(itemToBasket.count)")
                    .fontWeight(.bold)
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                    .padding(.horizontal, 3)
                    .background {
                        Capsule()
                            .fill(Color.red)
                    }
                    .offset(x: 15, y: -15)
         }


        }
        .frame(width: 30, height: 30)
    }
}

struct ItemModel: Codable, Hashable {
    let id: String
    var count = 0
}
