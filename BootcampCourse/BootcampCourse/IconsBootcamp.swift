//
//  IconsBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 23.03.2022.
//

import SwiftUI

struct IconsBootcamp: View {
    var body: some View {
        Image(systemName: "person.fill.badge.plus")
            .renderingMode(.original)
            .font(.largeTitle)
            //.resizable()
            //.aspectRatio(contentMode: .fit)
            //.scaledToFit()
            //.scaledToFill()
            //.frame(width: 300, height: 300)
            .foregroundColor(.blue)
            //.clipped()
    }
}

struct IconsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        IconsBootcamp()
    }
}
