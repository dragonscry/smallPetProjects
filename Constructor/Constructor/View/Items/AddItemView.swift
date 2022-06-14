//
//  AddItemView.swift
//  Constructor
//
//  Created by Denys on 05.06.2022.
//

import SwiftUI

struct AddItemView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var itemMV: ItemModelView
    @State var textFieldText = ""
    @State var price = ""
    
    var body: some View {
        VStack {
            TextField("Type Item name", text: $textFieldText)
                .underlineTextField()
            
            TextField("Type Item price", text: $price)
                .underlineTextField()
            
            Button {
                itemMV.saveItem(name: textFieldText, price: price)
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
        AddItemView()
    }
}
