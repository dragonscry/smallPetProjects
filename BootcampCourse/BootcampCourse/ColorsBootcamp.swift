//
//  ColorsBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 21.03.2022.
//

import SwiftUI

struct ColorsBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
//                //Color.primary
//                Color(.displayP3, red: 1.0, green: 0.0, blue: 0.0) //its new color literal can be found in properties
//                Color(UIColor.secondarySystemBackground) //ui colors
                Color("CustomColor")
           )
            .frame(width: 300, height: 200, alignment:  .center)
            .shadow(radius: 10)
    }
}

struct ColorsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ColorsBootcamp()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
    }
}
