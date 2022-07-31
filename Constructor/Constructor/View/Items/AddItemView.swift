//
//  AddItemView.swift
//  Constructor
//
//  Created by Denys on 05.06.2022.
//

import SwiftUI

struct AddItemView: View {
    
    @Environment(\.presentationMode) var presentationMode
    //@EnvironmentObject var coreDataVM: CoreDataRelationshipViewModel
    @EnvironmentObject var projectVM: ProjectsViewModel
    @EnvironmentObject var itemVM: ItemsViewModel
    @State var name = ""
    @State var price = ""
    @State var dimension = ""
    @State var description = ""
    
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
                        
                        TextField("Type kg/l/ft", text: $dimension)
                            .underlineTextField()
                    }
                }
                .padding(.bottom, 50)
                .padding(.horizontal)
                
                TextEditor(text: $description)
                    .border(Color.gray)
                    .padding()
                
                Button {
                    itemVM.addItem(name: name, price: Float(price) ?? 0, description: description, dimension: dimension, project: projectVM.selectedProject)
                    itemVM.getItems()
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
