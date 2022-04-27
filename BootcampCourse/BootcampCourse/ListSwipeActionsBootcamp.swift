//
//  ListSwipeActionsBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 27.04.2022.
//

import SwiftUI

struct ListSwipeActionsBootcamp: View {
    
    @State var fruits: [String] = ["apple","orange", "banana", "peach"]
    
    var body: some View {
        List{
            ForEach(fruits, id: \.self) {
                Text($0.capitalized)
                    .padding()
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button("Archive") {
                            
                        }
                        .tint(.green)
                        Button("Save") {
                            
                        }
                        .tint(.orange)
                        Button("Junk") {
                            
                        }
                        .tint(.blue)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
//                        Button("Share") {
//
//                        }
//                        .tint(.yellow)
                        Button {
                            
                        } label: {
                            Label("Unread", systemImage: "envelope.badge")
                        }

                        
                    }
            }
            //.onDelete(perform: delete)
        }
    }
    
    func delete(indexSet: IndexSet){
        
    }
}

struct ListSwipeActionsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ListSwipeActionsBootcamp()
    }
}
