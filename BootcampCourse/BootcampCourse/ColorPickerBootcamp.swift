//
//  ColorPickerBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 18.04.2022.
//

import SwiftUI

struct ColorPickerBootcamp: View {
    
    @State var backgroundColor : Color = Color.green
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            
            ColorPicker("Select Color",
                        selection: $backgroundColor,
                        supportsOpacity: true)
            
            .padding()
            .background(.black)
            .cornerRadius(10)
            .foregroundColor(.white)
            .font(.headline)
            .padding(50)
        }
    }
}

struct ColorPickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerBootcamp()
    }
}
