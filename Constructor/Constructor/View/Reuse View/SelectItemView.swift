//
//  SelectItemView.swift
//  Constructor
//
//  Created by Denys on 06.06.2022.
//

import SwiftUI

struct SelectItemView: View {
    
    //@EnvironmentObject var coreDataVM: CoreDataRelationshipViewModel
    @EnvironmentObject var projectVM: ProjectsViewModel
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var itemVM: ItemsViewModel
    @Binding var selectedRows : Set<ItemEntity>
    
    var body: some View {
        NavigationView {
            List {
                if let project = projectVM.selectedProject {
                    if let items = project.items?.allObjects as? [ItemEntity] {
                        ForEach(itemVM.items.filter({ item in
                            items.contains(item)
                        })) { item in
                            HStack{
                                ItemRow(item: item)
                                if selectedRows.contains(item) {
                                    Image(systemName: "heart.fill")
                                }
                            }
                            .onTapGesture {
                                if !selectedRows.contains(item){
                                    selectedRows.insert(item)
                                } else {
                                    selectedRows.remove(item)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Selected items \(selectedRows.count)")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Done")
                    }
                }
            }
        }
    }
}

//struct SelectItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectItemView()
//    }
//}
