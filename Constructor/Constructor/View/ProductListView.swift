//
//  ProductListView.swift
//  Constructor
//
//  Created by Denys on 05.06.2022.
//

import SwiftUI

struct ProductListView: View {
    @StateObject var productVM = ProductModelView()
    @State var isAddingProduct = false
    
    var body: some View {
        NavigationView {
            List {
                    ForEach(productVM.products, id: \.self) { product in
                        Text(product.name)
                        
                    }
                }
                .navigationTitle("All Products")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            self.isAddingProduct = true
                        } label: {
                            Image(systemName: "plus")
                        }
                        .sheet(isPresented: $isAddingProduct) {
                            Text("Product")
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
