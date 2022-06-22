//
//  AddProductView.swift
//  Constructor
//
//  Created by Denys on 06.06.2022.
//

import SwiftUI

struct AddProductView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var coreDataVM: CoreDataRelationshipViewModel
    @State var name = ""
    @State var items = Set<ItemEntity>()
    
    @State var isShowingSelectItem = false
    
    
    var body: some View {
        VStack {
            TextField("Type Product Name", text: $name)
                .underlineTextField()
            
            Button {
                self.isShowingSelectItem = true
            } label: {
                Text("Select Items")
                    .foregroundColor(.white)
                    .padding()
                    .background(.blue)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $isShowingSelectItem) {
                SelectItemView(selectedRows: $items)
            }

            
            Button {
                if items.isEmpty {
                    coreDataVM.addProduct(name: name)
                } else if !items.isEmpty {
                    coreDataVM.addProduct(name: name, items: items)
                }
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Save Product")
                    .foregroundColor(.white)
                    .padding()
                    .background(.blue)
                    .cornerRadius(10)
            }
        }
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}
