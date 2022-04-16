//
//  ContextMenu.swift
//  BootcampCourse
//
//  Created by Denys on 16.04.2022.
//

import SwiftUI

struct ContextMenu: View {
    
    @State var backgroundColor = Color.blue
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Image(systemName: "house.fill")
                .font(.title)
            Text("SwiftUI")
                .font(.headline)
            Text("How to use context menu")
                .font(.subheadline)
        }
        .foregroundColor(.white)
        .padding()
        .background(backgroundColor)
        .cornerRadius(30)
        .contextMenu(menuItems: {
            Button(action: {
                backgroundColor = .yellow
            }, label: {
                Label("Share post", systemImage: "flame.fill")
            })
            Button(action: {
                backgroundColor = .red
            }, label: {
                Text("Report post")
            })
            
            Button(action: {
                backgroundColor = .green
            }, label: {
                HStack{
                    Text("Like it")
                    Image(systemName: "heart.fill")
                }
            })
        })
    }
}

struct ContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenu()
    }
}
