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
    @State var isShowingItem = false
    
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
                
                Section {
                    Text("Total: \(sum)")
                        .onAppear(perform: totalSum)
                }
                
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
            }


            
            HStack {
                Button {
                    productVM.updateProduct(product: product, name: name)
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    SaveButtonLabel()
                }
                
                Spacer()
                
                Button {
                    isShowingSelectItem = true
                } label: {
                    SelectItemButtonLabel()
                }
                .sheet(isPresented: $isShowingSelectItem) {
                    AddItemsView(product: product)
                }

            
            }
            .padding(.horizontal)
        }

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
        self.totalSum()
    }
    
    func defaultValues() {
        if self.name == "" {
            self.name = product.name ?? ""
        }
    }
    
}

struct AddItemsView: View {
    
    @EnvironmentObject var productVM: ProductsViewModel
    @EnvironmentObject var itemsVM: ItemsViewModel
    @EnvironmentObject var projectVM: ProjectsViewModel
    @Environment(\.presentationMode) var presentationMode
    
    let product: ProductEntity
    @State var selectedRows = Set<ItemEntity>()
    
    var body: some View {
        VStack {
        List {
            if let project = projectVM.selectedProject {
                if let items = project.items?.allObjects as? [ItemEntity] {
                    if let prodItems = product.items?.allObjects as? [ItemEntity] {
                        ForEach(items.filter({ item in
                            !prodItems.contains(item)
                        })){ item in
                            HStack{
                                ItemRow(item: item)
                                if selectedRows.contains(item) {
                                    Image(systemName: "heart.fill")
                                }
                            }.onTapGesture {
                                if !selectedRows.contains(item){
                                    selectedRows.insert(item)
                                } else {
                                    selectedRows.remove(item)
                                }
                            }
                        }
                    }
                }
            }
        }
            Button {
                productVM.addItemsToProduct(items: selectedRows, product: product)
                presentationMode.wrappedValue.dismiss()
            } label: {
                SaveButtonLabel()
            }

        }
    }
}


//struct ProductDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailsView()
//    }
//}
