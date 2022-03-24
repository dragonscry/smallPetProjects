//
//  ImageBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 24.03.2022.
//

import SwiftUI

struct ImageBootcamp: View {
    var body: some View {
        Image("darpa")
            //.renderingMode(.template) //if image png it can be changed by color
            .resizable()
            //.aspectRatio(contentMode: .fit)
            .scaledToFit()
            //.scaledToFill()
            .frame(width: 300, height: 200)
            .foregroundColor(.green)
            //.clipped()
            //.cornerRadius(150)
           // .clipShape(
                //Circle()
                //RoundedRectangle(cornerRadius: 20)
               // Ellipse()
            //)
    }
}

struct ImageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ImageBootcamp()
    }
}
