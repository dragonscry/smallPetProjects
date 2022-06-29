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
    
    var arrayItems: [ItemEntity] {
        Array(items)
    }
    
    @State var isShowingSelectItem = false
    
    
    var body: some View {
        VStack {
            
            HStack {
                Button {
                    self.isShowingSelectItem = true
                } label: {
                    SelectItemButtonLabel()
                }
                .sheet(isPresented: $isShowingSelectItem) {
                    SelectItemView(selectedRows: $items)
                }
                
                Spacer()
                
                Button {
                    if items.isEmpty {
                        coreDataVM.addProduct(name: name)
                    } else if !items.isEmpty {
                        coreDataVM.addProduct(name: name, items: items)
                    }
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    SaveButtonLabel()
                }
            }
            .padding(.bottom, 40)
            
            HStack {
                DefaultPhotoView()
                TextField("Type Product Name", text: $name)
                    .underlineTextField()
            }
            
            List {
                Section(header: Text("Added items")) {
                    ForEach(arrayItems, id: \.self) { item in
                        ItemRow(item: item)
                    }
                }
            }
            

            
            Spacer()
            


            

        }
        .padding()
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}
