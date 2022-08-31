//
//  ItemListView.swift
//  Constructor
//
//  Created by Denys on 05.06.2022.
//

import SwiftUI

struct ItemListView: View {
    //@EnvironmentObject var coreDataVM: CoreDataRelationshipViewModel
    @EnvironmentObject var itemsVM: ItemsDataManager
    @EnvironmentObject var projectVM: ProjectsDataManager
    @State var isAddingItem = false
    @State var isAlert = false
    @State var isActive = false
    
    var body: some View {
        NavigationView {
            itemList
            .alert("Please, add a Project", isPresented: $isAlert, actions: {
                Button(role: .cancel) {
                    //
                } label: {
                    Text("OK")
                }

            })
            .navigationTitle("All Items")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if projectVM.selectedProject != nil {
                            self.isAddingItem = true
                        } else {
                            self.isAlert = true
                        }

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

extension ItemListView {
    var itemList: some View {
        List {
            if let project = projectVM.selectedProject {
                if let items = project.items?.allObjects as? [ItemEntity]
                {
                    ForEach(itemsVM.items.filter({ item in
                        items.contains(item)
                    })) { item in
                        NavigationLink {
                            ItemDetailsView(item: item)
                        } label: {
                            VStack {
                                //ItemRow(item: item)
                                Text("\(item.name ?? "")")
                            }

                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                Button {
                                    withAnimation(.easeOut(duration: 0.1)) {
                                        itemsVM.deleteItem2(item: item)
                                    }
                                } label: {
                                    Image(systemName: "trash")
                                }
                                .tint(.red)
                        }
                    }
                }

            }
        }
    }
}
