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
    @State var sum: String = ""
    
    var body: some View {
        VStack {
                HStack {
                    DefaultPhotoView()
                    
                    VStack {
                        TextField(entity.name ?? "", text: $name)
                            .underlineTextField()
                    }
                    
                }
                .padding(.horizontal)
            
            List {
                if let items = entity.items?.allObjects as? [ItemEntity] {
                    Section(header: Text("Items in product")) {
                        ForEach(items){ item in
                            NavigationLink {
                                ItemDetailsView(item: item)
                            } label: {
                                ItemRow(item: item)
                            }
                        }
                    }
                }
                Text("Total: \(sum)")
            }
            
            Button {
                coreDataVM.updateProduct(product: entity, name: name)
                //presentationMode.wrappedValue.dismiss()
            } label: {
                SaveButtonLabel()
            }
        }
        .onAppear(perform: totalSum)
    }
    
    func totalSum() {
        var s: Float = 0
        if let items = entity.items?.allObjects as? [ItemEntity] {
            for i in 0..<items.count {
                s += items[i].price
            }
        }
        
        sum = String(format: "%.2f", s)
    }
    
    
}

//struct ProductDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailsView()
//    }
//}
