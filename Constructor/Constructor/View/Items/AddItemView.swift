//
//  AddItemView.swift
//  Constructor
//
//  Created by Denys on 05.06.2022.
//

import SwiftUI

struct AddItemView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var coreDataVM: CoreDataRelationshipViewModel
    @State var name = ""
    @State var price = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    
                    DefaultPhotoView()
                    
                    VStack {
                        TextField("Type Item name", text: $name)
                            .underlineTextField()
                        
                        TextField("Type Item price", text: $price)
                            .underlineTextField()
                    }
                }
                .padding(.bottom, 50)
                .padding(.horizontal)
                
                Button {
                    coreDataVM.addItem(name: name, price: Float(price) ?? 0)
                    coreDataVM.getItems()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    SaveButtonLabel()
                }

                
                Spacer()

            }
            .navigationTitle("Add Item")
            .padding(.vertical)
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
