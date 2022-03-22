//
//  GradiensBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 22.03.2022.
//

import SwiftUI

struct GradiensBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
//                LinearGradient(
//                    gradient: Gradient(colors: [Color.red, Color.blue]),
//                    startPoint: .topLeading,
//                    endPoint: .bottomTrailing)
//                RadialGradient(
//                    gradient: Gradient(colors: [Color.red, Color.blue]),
//                    center: .topLeading,
//                    startRadius: 5,
//                    endRadius: 200)
                AngularGradient(
                    gradient: Gradient(colors: [Color.red, Color.blue]),
                    center: .topLeading,
                    angle: .degrees(225))
            )
            .frame(width: 300, height: 200)
    }
}

struct GradiensBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GradiensBootcamp()
    }
}
