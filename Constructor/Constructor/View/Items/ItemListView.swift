//
//  ItemListView.swift
//  Constructor
//
//  Created by Denys on 05.06.2022.
//

import SwiftUI

struct ItemListView: View {
    
    @EnvironmentObject var itemMV: ItemModelView
    @EnvironmentObject var coreDataVM: CoreDataRelationshipViewModel
    //@StateObject var itemMV = ItemModelView()
    @State var isAddingItem = false
    
    var body: some View {
        NavigationView {
            List {
//                ForEach(itemMV.items) { item in
//                    NavigationLink {
//                        ItemDetailsView(item: item)
//                    } label: {
//                        HStack{
//                            Text(item.name)
//                            Spacer()
//                            Text("\(item.price)")
//                        }
//                    }
//                }
                ForEach(coreDataVM.items) { item in
                    NavigationLink {
                        ItemDetailsView(item: item)
                    } label: {
                        HStack {
                            Text(item.name ?? "Item")
                            Spacer()
                            Text("\(item.price)")
                        }
                    }
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

