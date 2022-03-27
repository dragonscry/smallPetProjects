//
//  StackBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 27.03.2022.
//

import SwiftUI

struct StackBootcamp: View {
    //VStack - vertical
    //ZStack - z
    //HStack - horizontal
    var body: some View {
//        VStack
//        //HStack
//        //ZStack
//        {
//            Rectangle()
//                .fill(Color.red)
//                .frame(width: 100, height: 100)
//            Rectangle()
//                .fill(Color.yellow)
//                .frame(width: 100, height: 100)
//            Rectangle()
//                .fill(Color.green)
//                .frame(width: 100, height: 100)
//        }
        
//        ZStack {
//            Rectangle()
//                .fill(Color.yellow)
//                .frame(width: 400, height: 500)
//            VStack{
//                Rectangle()
//                    .fill(Color.red)
//                    .frame(width: 200, height: 200)
//                Rectangle()
//                    .fill(Color.green)
//                    .frame(width: 150, height: 150)
//                HStack {
//                    Rectangle()
//                        .fill(Color.pink)
//                        .frame(width: 75, height: 75)
//                    Rectangle()
//                        .fill(Color.purple)
//                        .frame(width: 100, height: 100)
//                    Rectangle()
//                        .fill(Color.blue)
//                        .frame(width: 25, height: 25)
//                }
//            }
//        }
        
        VStack(alignment: .center, spacing: 20){
            Text("Items in your cart")
                .font(.caption)
                .foregroundColor(.gray)
            Text("5")
                .font(.title)
                .underline()
        }
    }
}

struct StackBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StackBootcamp()
    }
}
