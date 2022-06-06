//
//  AddProductView.swift
//  Constructor
//
//  Created by Denys on 06.06.2022.
//

import SwiftUI

struct AddProductView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var itemMV: ItemModelView
    @EnvironmentObject var productMV: ProductModelView
    @State var textFieldText = ""
    @State var items = Set<Item>()
    
    @State var isShowingSelectItem = false
    
    
    var body: some View {
        VStack {
            TextField("", text: $textFieldText)
                .placeholder(when: textFieldText.isEmpty, placeholder: {
                    Text("type name here").foregroundColor(.white).opacity(0.8)
                })
                .padding()
                .padding(.horizontal)
                .background(.green)
                .cornerRadius(10)
                .padding(.horizontal)
            
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
                if items.isEmpty{
                    productMV.saveProduct(name: textFieldText)
                } else {
                    productMV.saveProduct(name: textFieldText, items: self.items)
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
