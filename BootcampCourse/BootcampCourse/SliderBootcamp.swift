//
//  SliderBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 18.04.2022.
//

import SwiftUI

struct SliderBootcamp: View {
    
    @State var sliderValue = 3.0
    @State var color: Color = .red
    var body: some View {
        VStack {
            
            Text("Rating:")
            Text(
                //"\(sliderValue)"
                String(format: "%.1f", sliderValue)
            )
            .foregroundColor(color)
  //          Slider(value: $sliderValue)
            
  //          Slider(value: $sliderValue, in: 1...5)
 //           Slider(value: $sliderValue, in: 1...5, step: 0.1)
            Slider(
                value: $sliderValue,
                in: 1...5,
                step: 1.0) {
                    Text("Title")
                } minimumValueLabel: {
                    Text("1")
                        .font(.largeTitle)
                        .foregroundColor(.orange)
                } maximumValueLabel: {
                    Text("5")
                } onEditingChanged: { (_) in
                    color = .green
                }

            
        }
    }
}

struct SliderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SliderBootcamp()
    }
}
