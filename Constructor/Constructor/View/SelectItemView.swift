//
//  SelectItemView.swift
//  Constructor
//
//  Created by Denys on 06.06.2022.
//

import SwiftUI

struct SelectItemView: View {
    
    @EnvironmentObject var coreDataVM: CoreDataRelationshipViewModel
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedRows : Set<ItemEntity>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(coreDataVM.items) { item in
                    HStack{
                        Text(item.name ?? "")
                        Spacer()
                        Text("\(item.price)")
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
