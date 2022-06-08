//
//  ItemDetailsView.swift
//  Constructor
//
//  Created by Denys on 06.06.2022.
//

import SwiftUI

struct ItemDetailsView: View {
    
    @EnvironmentObject var itemMV: ItemModelView
    //@StateObject var itemMV: ItemModelView
    @Environment(\.presentationMode) var presentationMode
    var item : Item
    @State var textFieldText = ""
    @State var price = ""
    
    var body: some View {
        VStack {
            TextField(item.name, text: $textFieldText)
                .placeholder(when: textFieldText.isEmpty, placeholder: {
                    Text(item.name).foregroundColor(.white).opacity(0.8)
                })
                .padding()
                .padding(.horizontal)
                .background(.green)
                .cornerRadius(10)
                .padding(.horizontal)
            
            TextField("\(item.price)", text: $price)
                .placeholder(when: textFieldText.isEmpty, placeholder: {
                    Text(String(item.price)).foregroundColor(.white).opacity(0.8)
                })
                .keyboardType(.numberPad)
                .padding()
                .padding(.horizontal)
                .background(.green)
                .cornerRadius(10)
                .padding(.horizontal)
            
            Button {
                item.update(name: textFieldText, price: Int(price) ?? 0)
                itemMV.refresh()
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Save Item")
                    .foregroundColor(.white)
                    .padding()
                    .background(.blue)
                    .cornerRadius(10)
            }
        }
    }
}

//struct ItemDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemDetailsView(item: Item(name: "Logan", price: 20))
//    }
//}
