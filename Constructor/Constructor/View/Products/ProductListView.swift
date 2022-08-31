//
//  ProductListView.swift
//  Constructor
//
//  Created by Denys on 05.06.2022.
//

import SwiftUI

struct ProductListView: View {
    @EnvironmentObject var productVM: ProductsDataManager
    @EnvironmentObject var projectVM: ProjectsDataManager
    //@EnvironmentObject var productListVM: ProductListViewModel
    @State var isAddingProduct = false
    @State var isAlert = false
    
    var body: some View {
        NavigationView {
            productList
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
    
    var body: some View {
        HStack {
            Text(product.name ?? "UnnamedProduct")
            Spacer()
            Text("\(String(format: "%.2f", product.price))")
        }
        
    }
}

extension ProductListView {
    
    var productList: some View {
        List {
            if let project = projectVM.selectedProject {
                if let products = project.products?.allObjects as? [ProductEntity]{
                    ForEach(productVM.products.filter({ product in
                        products.contains(product)
                    })) { product in
                        NavigationLink {
                            ProductDetailsView(product: product)
                        } label: {
                            Text("\(product.name ?? "Unnamed Product")")
                        }
                    }
                    .onDelete(perform: productVM.deleteProduct)
                }
            }
            
        }
    }
}
