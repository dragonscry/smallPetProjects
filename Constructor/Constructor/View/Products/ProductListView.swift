//
//  ProductListView.swift
//  Constructor
//
//  Created by Denys on 05.06.2022.
//

import SwiftUI

struct ProductListView: View {
    //@EnvironmentObject var coreDataVM: CoreDataRelationshipViewModel
    @EnvironmentObject var productVM: ProductsViewModel
    @EnvironmentObject var projectVM: ProjectsViewModel
    @State var isAddingProduct = false
    @State var isAlert = false
    
    var body: some View {
        NavigationView {
            List {
                if let project = projectVM.selectedProject {
                    if let products = project.products?.allObjects as? [ProductEntity]{
                        ForEach(productVM.products.filter({ product in
                            products.contains(product)
                        })) { product in
                            NavigationLink {
                                ProductDetailsView(product: product)
                            } label: {
                                ProductRow(product: product)
                            }
                        }
                        .onDelete(perform: productVM.deleteProduct)
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
                        if projectVM.selectedProject != nil {
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

//Custom Product row
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
    
    //convert float to float with 2 decimals
    func chSum() {
        self.sum = String(format: "%.2f", s)
    }
    
    //calculates sums from all items
    func getPrice() -> Float {
        var s : Float = 0
        if let items = product.items?.allObjects as? [ItemEntity] {
            for i in 0..<items.count {
                s += items[i].price * Float(getItemCount(item: items[i])?.count ?? 1)
            }
        }
        return s
    }
    
    //get item count which connected to item
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
