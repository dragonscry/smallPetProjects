//
//  ExtractedFunctionsBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 07.04.2022.
//

import SwiftUI

struct ExtractedFunctionsBootcamp: View {
    
    @State var backgroundColor = Color.pink
    
    
    var body: some View {
        contentLayer
    }
    
    var contentLayer: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            
            VStack{
                Text("Title")
                    .font(.largeTitle)
                Button(action: {
                    changeColor()
                }, label: {
                    Text("Press Me")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                })
            }
        }
    }
    
    func changeColor() {
        self.backgroundColor = .purple
    }
}

struct ExtractedFunctionsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ExtractedFunctionsBootcamp()
    }
}
