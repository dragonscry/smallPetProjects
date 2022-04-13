//
//  ListBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 13.04.2022.
//

import SwiftUI

struct ListBootcamp: View {
    
    @State var fruits: [String] = [
    "apple", "orange", "banana", "peach"
    ]
    
    @State var veggies: [String] = [
    "tomato", "potato", "carrot"
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section(content: {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit.capitalized)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                    .listRowBackground(Color.pink)
                }, header: {Text("Fruits").foregroundColor(.blue)})
                
                Section(content: {
                    ForEach(veggies, id: \.self) { veggie in
                        Text(veggie.capitalized)
                    }
                }, header: {Text("Veggies")})
                
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Grocery List")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                        .foregroundColor(.red)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    addButton
                }
            }
        }
    }
    
    var addButton: some View {
        Button("Add"){
            add()
        }
    }
    
    func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        fruits.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func add() {
        fruits.append("Coconut")
    }
}

struct ListBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ListBootcamp()
    }
}
