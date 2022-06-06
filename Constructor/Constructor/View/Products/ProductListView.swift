//
//  ProductListView.swift
//  Constructor
//
//  Created by Denys on 05.06.2022.
//

import SwiftUI

struct ProductListView: View {
    @EnvironmentObject var productMV: ProductModelView
    @State var isAddingProduct = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(productMV.products) { product in
                    HStack{
                        Text(product.name)
                        Spacer()
                        Text("\(product.price)")
                    }
                    
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
