//
//  ListView.swift
//  TodoList
//
//  Created by Denys on 28.04.2022.
//

import SwiftUI

struct ListView: View {
    
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        
        .navigationTitle("Todo List 📝")
        .toolbar {

            ToolbarItem(placement: .navigationBarLeading) {
                if !listViewModel.items.isEmpty {
                    EditButton()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add", destination: AddView())
            }
        }
    }
    
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


