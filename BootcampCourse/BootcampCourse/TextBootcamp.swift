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
            Text("Bold text".capitalized)
                .fontWeight(.heavy)
                .underline()
            // Italic + strike
            Text("Im Italic")
                .italic()
                .strikethrough()
            //Underline with color
            Text("Underline Color".lowercased())
                .font(.title)
                .underline(true, color: Color.green)
            //Text through system5
            Text("System")
                .font(.system(size: 24, weight: .semibold, design: .serif))
            //Text Multiline
            Text("Multiline Text! This is Text for course and for practicing.")
                .baselineOffset(10) // baseline offset between text
                .kerning(5) // offset between letters
                .multilineTextAlignment(.center) // how will be multiline text oriented
                .foregroundColor(.blue) //text color
                .frame(width: 200, height: 100, alignment: .leading) // frame for text
                .minimumScaleFactor(0.1) //resize for text
        }
    }
}

struct TextBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextBootcamp()
    }
}
