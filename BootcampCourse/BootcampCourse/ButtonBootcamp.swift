//
//  ButtonBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 06.04.2022.
//

import SwiftUI

struct ButtonBootcamp: View {
    
    @State var title = "This is title"
    
    var body: some View {
        VStack {
            Text(title)
            
            Button("Press") {
                self.title = "Button pressed"
            }
            .accentColor(.red)
            
            Button(action: {
                self.title = "Button was pressed"
            }, label: {
                Text("Save".uppercased())
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(Color.blue
                        .cornerRadius(20)
                        .shadow(radius: 10)
                    )
            })
            
            Button(action: {
                self.title = "Button 3"
            }, label: {
                Circle()
                    .fill(Color.white)
                    .frame(width: 75, height: 75)
                    .shadow(radius: 10)
                    .overlay(Image(systemName: "heart.fill")
                        .font(.largeTitle)
                        .foregroundColor(Color.red)
                    )
            })
            
            Button(action: {
                
            }, label: {
                Text("Finish".uppercased())
                    .font(.caption)
                    .bold()
                    .foregroundColor(.gray)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .stroke(Color.gray, lineWidth: 2.0)
                    )
            })
        }
    }
}

struct ButtonBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBootcamp()
    }
}
