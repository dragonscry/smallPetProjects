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
    
    var body: some View {
        NavigationView {
            List {
                ForEach(coreDataVM.products) { product in
                    NavigationLink {
                        ProductDetailsView(entity: product)
                    } label: {
                        ProductRow(product: product)
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
                s += items[i].price
            }
        }
        return s
    }
}
