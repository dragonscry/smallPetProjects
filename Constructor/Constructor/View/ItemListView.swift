//
//  ItemListView.swift
//  Constructor
//
//  Created by Denys on 05.06.2022.
//

import SwiftUI

struct ItemListView: View {
    
    @StateObject var itemVM: ItemModelView = ItemModelView()
    @State var isAddingItem = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(itemVM.items, id: \.self) { item in
                    Text(item.name)
                    
                }
            }
            .navigationTitle("All Items")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.isAddingItem = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $isAddingItem) {
                        AddItemView(itemVM: itemVM)
                    }
                    
                }
            }
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView()
    }
}
