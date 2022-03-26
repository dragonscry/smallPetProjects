//
//  BackgroundAndOverlayBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 26.03.2022.
//

import SwiftUI

struct BackgroundAndOverlayBootcamp: View {
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//
//            .background(
//                //Color.red
//                //LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing)
//                Circle()
//                    .fill(LinearGradient(colors: [Color.red, Color.blue], startPoint: .trailing, endPoint: .leading))
//                    .frame(width: 100, height: 100, alignment: .center)
//            )
//            .background(
//                Circle()
//                    .fill(LinearGradient(colors: [Color.red, Color.blue], startPoint: .leading, endPoint: .trailing))
//                    .frame(width: 120, height: 120, alignment: .center)
//            )
//        Circle()
//            .fill(Color.pink)
//            .frame(width: 100, height: 100, alignment: .center)
//            .overlay(
//                Text("1")
//                    .font(.largeTitle)
//                    .foregroundColor(.white)
//            )
//            .background(
//                Circle()
//                    .fill(Color.purple)
//                    .frame(width: 110, height: 110, alignment: .center)
//            )
//        Rectangle()
//            .frame(width: 100, height: 100)
//            .overlay(
//                Rectangle()
//                    .fill(.blue)
//                    .frame(width: 50, height: 50)
//                , alignment: .topLeading
//            )
//            .background(
//                Rectangle()
//                    .fill(Color.red)
//                    .frame(width: 150, height: 150)
//                , alignment: .bottomTrailing
//            )
        Image(systemName: "heart.fill")
            .foregroundColor(.white)
            .font(.system(size: 40))
            .background(
                Circle()
                    .fill(LinearGradient(
                        colors: [Color(red: 1.0, green: 0.3, blue: 0.4), Color(red: 1.0, green: 0.7, blue: 0.3)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                    )
                    .frame(width: 100, height: 100)
                    .shadow(color: Color(red: 1.0, green: 0.7, blue: 0.3).opacity(0.7), radius: 10, x: 0.0, y: 10)
                    .overlay(
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 30, height: 30)
                            .overlay(
                                Text("5")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            )
                            .shadow(color: Color(red: 0.3, green: 0.5, blue: 1.0).opacity(0.7), radius: 5, x: 0.0, y: 5)
     
                        , alignment: .bottomTrailing
                    )
            )
    }
}

struct BackgroundAndOverlayBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundAndOverlayBootcamp()
    }
}
