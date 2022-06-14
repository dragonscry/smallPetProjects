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
                .underlineTextField()
            
            TextField("\(item.price)", text: $price)
                .underlineTextField()
            
            Button {
     //           item.update(name: textFieldText, price: Int(price) ?? 0)
                itemMV.update(item: item, name: textFieldText, price: Int(price) ?? 0)
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
