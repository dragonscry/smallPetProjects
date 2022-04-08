//
//  ExtractSubViewBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 08.04.2022.
//

import SwiftUI

struct ExtractSubViewBootcamp: View {
    var body: some View {
        ZStack {
            Color(.purple).opacity(0.8)
                .ignoresSafeArea()
            
            contentLayer
            
        }
    }
    
    var contentLayer: some View {
        HStack {
            MyItem(title: "Orange", count: 4, color: .orange)
            MyItem(title: "Apple", count: 4, color: .red)
            MyItem(title: "Bananas", count: 32, color: .yellow)
        }
    }
}

struct ExtractSubViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ExtractSubViewBootcamp()
    }
}

struct MyItem: View {
    
    let title: String
    let count: Int
    let color: Color
    
    var body: some View {
        VStack {
            Text("\(count)")
            Text(title)
        }
        .font(.title)
        .foregroundColor(.white)
        .padding()
        .background(color)
        .cornerRadius(10)
    }
}
