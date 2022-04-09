//
//  ConditionalBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 09.04.2022.
//

import SwiftUI

struct ConditionalBootcamp: View {
    
    @State var showCircle: Bool = false
    @State var showRectange: Bool = false
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Button("Is Loading") {
                isLoading.toggle()
            }
            
            if isLoading {
                ProgressView()
            }
            
            Button("Circle Button: \(showCircle.description)") {
                showCircle.toggle()
            }
            
            Button("Rectangle Button: \(showRectange.description)") {
                showRectange.toggle()
            }
            
            if showCircle {
                Circle()
                    .frame(width: 100, height: 100)
            }
            if showRectange {
                Rectangle()
                    .frame(width: 100, height: 100)
            }
            if !showCircle && !showRectange {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 200, height: 100)
            }
            
            Spacer()
        }
    }
}

struct ConditionalBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalBootcamp()
    }
}
