//
//  ItemListView.swift
//  Constructor
//
//  Created by Denys on 05.06.2022.
//

import SwiftUI

struct ItemListView: View {
    @EnvironmentObject var coreDataVM: CoreDataRelationshipViewModel
    @State var isAddingItem = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(coreDataVM.items) { item in
                    NavigationLink {
                        ItemDetailsView(item: item)
                    } label: {
                        ItemRow(item: item)
                    }
                }
                .onDelete(perform: coreDataVM.deleteItem)
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
                        AddItemView()
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

//WHY IS NOT UPDATED??(((
struct ItemRow: View {
    var item : ItemEntity
    
    var body: some View {
        HStack {
            Text(item.name ?? "")
            Spacer()
            Text(String(format: "%.2f", item.price))
        }
    }
}
