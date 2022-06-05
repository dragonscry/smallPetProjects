//
//  AddItemView.swift
//  Constructor
//
//  Created by Denys on 05.06.2022.
//

import SwiftUI

struct AddItemView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var itemVM: ItemModelView
    @State var textFieldText = ""
    @State var price = ""
    
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
            
            TextField("", text: $price)
                .placeholder(when: textFieldText.isEmpty, placeholder: {
                    Text("type price here").foregroundColor(.white).opacity(0.8)
                })
                .keyboardType(.numberPad)
                .padding()
                .padding(.horizontal)
                .background(.green)
                .cornerRadius(10)
                .padding(.horizontal)
            
            Button {
                itemVM.saveItem(name: textFieldText, price: price)
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Save Item")
                    .foregroundColor(.white)
                    .padding()
                    .background(.blue)
                    .cornerRadius(10)
            }

            
            Spacer()

        }
        .padding(.vertical)
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(itemVM: ItemModelView())
    }
}


extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
