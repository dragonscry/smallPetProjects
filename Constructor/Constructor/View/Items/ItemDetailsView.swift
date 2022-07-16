//
//  ItemDetailsView.swift
//  Constructor
//
//  Created by Denys on 06.06.2022.
//

import SwiftUI

struct ItemDetailsView: View {
    
    @EnvironmentObject var coreDataVM: CoreDataRelationshipViewModel
    @Environment(\.presentationMode) var presentationMode
    var item : ItemEntity
    @State var name = ""
    @State var price = ""
    
    var body: some View {
        VStack {
            HStack {
                
                DefaultPhotoView()
                
                VStack {
                    TextField(item.name ?? "", text: $name)
                        .underlineTextField()
                    
                    TextField("\(item.price)", text: $price)
                        .underlineTextField()
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 50)

            
            Button {
                coreDataVM.updateItem(item: item, name: name, price: Float(price) ?? 0)
                presentationMode.wrappedValue.dismiss()
            } label: {
                SaveButtonLabel()
            }
            
            Spacer()
            
        }
        .onAppear(perform: defaultValues)
    }
    
    func defaultValues() {
        self.name = item.name ?? ""
        self.price = String(item.price)
    }
}

//struct ItemDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemDetailsView(item: Item(name: "Logan", price: 20))
//    }
//}
