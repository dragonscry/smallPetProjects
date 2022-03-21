//
//  ShapesBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 21.03.2022.
//

import SwiftUI

struct ShapesBootcamp: View {
    var body: some View {
        VStack {
//            Circle() //circle shape
//            Ellipse() //elipse shape
//            Rectangle() //common rectangle
            RoundedRectangle(cornerRadius: 20) //rectangle with rounded corner
                .frame(width: 200, height: 100, alignment: .center)
//            Capsule(style: .circular) //capsule shape
//            Capsule(style: .continuous)
//                .fill(Color.blue) //color
//                .foregroundColor(.pink) //color too
//                .stroke() //make not full shape
//                .stroke(Color.red, lineWidth: 20) //customize stroke
//                .stroke(Color.orange, style: StrokeStyle(lineWidth: 20, lineCap: .butt, dash: [10,20,50])) //customise stroke
//                .trim(from: 0.1, to: 1) //cut shapes
//                .stroke(Color.purple, lineWidth: 20)
        }
    }
}

struct ShapesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ShapesBootcamp()
    }
}
