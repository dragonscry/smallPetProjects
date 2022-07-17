//
//  ProductListView.swift
//  Constructor
//
//  Created by Denys on 05.06.2022.
//

import SwiftUI

struct ProductListView: View {
    @EnvironmentObject var coreDataVM: CoreDataRelationshipViewModel
    @State var isAddingProduct = false
    @State var isAlert = false
    
    var body: some View {
        NavigationView {
            List {
                if let project = coreDataVM.selectedProject {
                    if let products = project.products?.allObjects as? [ProductEntity]{
                        ForEach(products) { product in
                            NavigationLink {
                                ProductDetailsView(product: product)
                            } label: {
                                ProductRow(product: product)
                            }
                        }
                        .onDelete(perform: coreDataVM.deleteProduct)
                    }
                }
                
            }
            .alert("Please, add a Project", isPresented: $isAlert, actions: {
                Button(role: .cancel) {
                    //
                } label: {
                    Text("OK")
                }
                
            })
            .navigationTitle("All Products")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if coreDataVM.selectedProject != nil {
                            self.isAddingProduct = true
                        } else {
                            self.isAlert = true
                        }
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $isAddingProduct) {
                        AddProductView()
                    }
                    
                }
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}

struct ProductRow: View {
    
    let product: ProductEntity
    @State var sum : String = ""
    var s : Float { getPrice()}
    
    var body: some View {
        HStack {
            Text(product.name ?? "UnnamedProduct")
            Spacer()
            Text("\(sum)")
        }
        .onAppear(perform: chSum)
        
    }
    
    func chSum() {
        self.sum = String(format: "%.2f", s)
    }
    
    func getPrice() -> Float {
        var s : Float = 0
        if let items = product.items?.allObjects as? [ItemEntity] {
            for i in 0..<items.count {
                s += items[i].price * Float(getItemCount(item: items[i])?.count ?? 1)
            }
        }
        return s
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
}
