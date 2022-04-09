//
//  AnimationBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 09.04.2022.
//

import SwiftUI

struct AnimationBootcamp: View {
    
    @State var isAnimated: Bool = false
    
    var body: some View {
        VStack {
            Button("Button") {
//                withAnimation(Animation.default.repeatCount(5, autoreverses: true))
//                {
                    isAnimated.toggle()
//                }
            }
            Spacer()
            RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
                .fill(isAnimated ? .red : .green)
                .frame(width: 300, height: 300)
                .rotationEffect(Angle(degrees: isAnimated ? 720 : 0))
                .offset(y: isAnimated ? 100 : 0)
                .animation(Animation.default.repeatForever(), value: isAnimated)
            Spacer()
        }
    }
}

struct AnimationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimationBootcamp()
    }
}
