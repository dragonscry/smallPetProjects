//
//  DarkModeBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 20.04.2022.
//

import SwiftUI

struct DarkModeBootcamp: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("This text is PRIMARY")
                        .foregroundColor(.primary)
                    Text("This text is SECONDARY")
                        .foregroundColor(.secondary)
                    Text("This color is BLACK")
                        .foregroundColor(.black)
                    Text("This color is WHITE")
                        .foregroundColor(.white)
                    Text("This color is RED")
                        .foregroundColor(.red)
                    Text("This color is globally adaptive")
                        .foregroundColor(Color("AdapriveColor"))
                    Text("This color is locally adaptive")
                        .foregroundColor(colorScheme == .light ? .green : .purple)
                }
            }
            .navigationTitle("Dark Mode Bootcamp")
        }
    }
}

struct DarkModeBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            DarkModeBootcamp()
                .preferredColorScheme(.dark)
            DarkModeBootcamp()
                .preferredColorScheme(.light)
        }

    }
}
