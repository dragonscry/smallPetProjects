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
    @EnvironmentObject var projectVM: ProjectsDataManager
    @EnvironmentObject var itemVM: ItemsDataManager
    @State var name = ""
    @State var price = ""
    @State var dimension = ""
    @State var description = ""
    
    var body: some View {
        NavigationView {
            VStack {

                info
                
                TextField("Description", text: $description)
                    .underlineTextField()
                
                saveButton

                
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

extension AddItemView {
    
    var info : some View {
        HStack {
            
            DefaultPhotoView()
            
            VStack {
                TextField("Type Item name", text: $name)
                    .underlineTextField()
                
                TextField("Type Item price", text: $price)
                    .underlineTextField()
                    .keyboardType(.numbersAndPunctuation)
                
                TextField("Type kg/l/ft", text: $dimension)
                    .underlineTextField()
            }
        }
        .padding(.bottom, 50)
        .padding(.horizontal)
    }
    
    var saveButton: some View {
        
        Button {
            itemVM.addItem(name: name, price: Float(price) ?? 0, description: description, dimension: dimension, project: projectVM.selectedProject)
            itemVM.getItems()
            presentationMode.wrappedValue.dismiss()
        } label: {
            DefaultButton(text: "Save")
        }
    }
    
}
