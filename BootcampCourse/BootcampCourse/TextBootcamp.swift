//
//  TextBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 20.03.2022.
//

import SwiftUI

struct TextBootcamp: View {
    var body: some View {
        VStack {
            //Title
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.title)
            //Bold Text + underline
            Text("Bold")
                .fontWeight(.heavy)
                .underline()
        }
    }
}

struct TextBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextBootcamp()
    }
}
