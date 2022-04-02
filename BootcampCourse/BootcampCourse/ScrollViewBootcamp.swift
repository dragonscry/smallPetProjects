//
//  ScrollViewBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 02.04.2022.
//

import SwiftUI

struct ScrollViewBootcamp: View {
    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack{
//                ForEach(0..<10){index in
//                    ZStack{
//                        Rectangle()
//                            .fill(Color.blue)
//                            .frame(width: 300, height: 200)
//                            .cornerRadius(40)
//                        Text("Its turn : \(index)")
//                            .font(.largeTitle)
//                            .foregroundColor(.white)
//                    }
//                }
//            }
//        }
        
        ScrollView{
            LazyVStack {
                ForEach(0..<10) { index in
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack{
                            ForEach(0..<10){ index in
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(.white)
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ScrollViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewBootcamp()
    }
}
