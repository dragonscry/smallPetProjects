//
//  ItemListView.swift
//  Constructor
//
//  Created by Denys on 05.06.2022.
//

import SwiftUI

struct ItemListView: View {
    //@EnvironmentObject var coreDataVM: CoreDataRelationshipViewModel
    @EnvironmentObject var itemsVM: ItemsViewModel
    @EnvironmentObject var projectVM: ProjectsViewModel
    @State var isAddingItem = false
    @State var isAlert = false
    
    var body: some View {
        NavigationView {
            List {
                if let project = projectVM.selectedProject {
                    if let items = project.items?.allObjects as? [ItemEntity]
                    {
                        ForEach(items) { item in
                            NavigationLink {
                                ItemDetailsView(item: item)
                            } label: {
                                VStack {
                                    //ItemRow(item: item)
                                    Text("\(item.name ?? "")")
                                }

                            }
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    withAnimation(.easeOut(duration: 0.2)) {
                                        itemsVM.deleteItem2(item: item)
                                    }
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }

                            }
                        }
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
