//
//  LazyVGridBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 02.04.2022.
//

import SwiftUI

struct LazyVGridBootcamp: View {
    
    let columns: [GridItem] = [
      //  GridItem(.fixed(50), spacing: nil, alignment: nil)
       // GridItem(.flexible(), spacing: nil, alignment: nil)
      //  GridItem(.adaptive(minimum: 10, maximum: 300), spacing: nil, alignment: nil)
        GridItem(.flexible(), spacing: 10), //this spacing between COLUMNS
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            
            Rectangle()
                .fill(Color.orange)
                .frame(height: 400)
            
            LazyVGrid(columns: columns,
                      alignment: .center,
                      spacing: 20, //this spacing between ROADS
                      pinnedViews: [.sectionHeaders]) {
                
                Section(header:
                            Text("Section one")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.blue)
                    .padding()
                ){
                    ForEach(0..<20) { index in
                        Rectangle()
                            .frame(height: 150)
                    }
                }
                
                Section(header:
                            Text("Section two")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.red)
                    .padding()
                ){
                    ForEach(0..<20) { index in
                        Rectangle()
                            .fill(Color.green)
                            .frame(height: 150)
                    }
                }
            }
            
//            Rectangle()
//                .fill(Color.white)
//                .frame(height: 400)
            
//            LazyVGrid(columns: columns) {
//                ForEach(0..<50) { index in
//                    Rectangle().frame(height: 150)
//                }
//            }
        }
    }
}

struct LazyVGridBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGridBootcamp()
    }
}
