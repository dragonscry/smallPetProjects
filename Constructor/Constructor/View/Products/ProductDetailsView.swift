//
//  ProductDetailsView.swift
//  Constructor
//
//  Created by Denys on 17.06.2022.
//

import SwiftUI

struct ProductDetailsView: View {
    
    let product: ProductEntity
    @Environment(\.presentationMode) var presentationMode
    //@EnvironmentObject var coreDataVM: CoreDataRelationshipViewModel
    @EnvironmentObject var productVM: ProductsViewModel
    @EnvironmentObject var projectVM: ProjectsViewModel
    @State var name = ""
    @State var sum: String = ""
    
    @State var isShowingSelectItem = false
    
    var body: some View {
        VStack {
            HStack {
                DefaultPhotoView()
                
                VStack {
                    TextField(product.name ?? "", text: $name)
                        .underlineTextField()
                }
                
            }
            .onAppear(perform: defaultValues)
            .padding(.horizontal)
            
            List {
                if let items = product.items?.allObjects as? [ItemEntity] {
                    Section(header: Text("Items in product")) {
                        ForEach(items){ item in
                            VStack {
                                ItemRowWithStepper(item: item, itemCount: getItemCount(item: item), sum: $sum)
                            }
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    self.deleteItemFromProduct(item: item)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }

                            }
                        }
                    }
                }
                Text("Total: \(sum)")
            }
            HStack {
                Button {
                    productVM.updateProduct(product: product, name: name)
                    //presentationMode.wrappedValue.dismiss()
                } label: {
                    SaveButtonLabel()
                }
                
                Spacer()
                
                Button {
                    totalSum()
                    //presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "clock")
                }
            }
            .padding(.horizontal)
        }
        .onAppear(perform: totalSum)
    }
    
    func totalSum() {
        var s: Float = 0
        if let items = product.items?.allObjects as? [ItemEntity] {
            for i in 0..<items.count {
                s += items[i].price * Float(getItemCount(item: items[i])?.count ?? 1)
            }
        }
        
        sum = String(format: "%.2f", s)
    }
    
    func getItemCount(item: ItemEntity) -> ItemCountEntity? {
        
        if let itemCounts = product.itemCounts?.allObjects as? [ItemCountEntity] {
            let count = itemCounts.first { itemCount in
                itemCount.idItem == item.itemID
            }
            
            return count
        }
        
        return nil
    }
    
    func deleteItemFromProduct(item: ItemEntity) {
        self.product.removeFromItems(item)
        productVM.save()
    }
    
    func defaultValues() {
        if self.name == "" {
            self.name = product.name ?? ""
        }
    }
    
}


//struct ProductDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailsView()
//    }
//}
