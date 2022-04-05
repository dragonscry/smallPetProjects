//
//  SafeAreaBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 05.04.2022.
//

import SwiftUI

struct SafeAreaBootcamp: View {
    var body: some View {
//        ZStack {
//
//            //Background
//
//            Color.blue
//                .edgesIgnoringSafeArea(.all)
//
//            //Foreground
//            VStack {
//                Text("Hello, World!")
//                Spacer()
//                //.edgesIgnoringSafeArea(.all)
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//        }
        
        ScrollView {
            VStack {
                Text("Title goes here")
                    .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                ForEach(0..<10) {index in
                    RoundedRectangle(cornerRadius: 35)
                        .fill(Color.white)
                        .frame(height: 150)
                        .shadow(radius: 20)
                        .padding(20)
                }
            }
        }
        .background(Color.blue)
    }
    
}

struct SafeAreaBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaBootcamp()
    }
}
