//
//  ButtonStyleBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 26.04.2022.
//

import SwiftUI

struct ButtonStyleBootcamp: View {
    var body: some View {
        VStack {
            
            Button {
                
            } label: {
                Text("Button")
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 20))
            .controlSize(.large)

            
            Button("Buttom") {
                
            }
            .font(.headline)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            //.buttonStyle(.plain)
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
            
            Button("Buttom") {
                
            }
            .font(.headline)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .controlSize(.regular)
            //.buttonStyle(.bordered)
            .buttonStyle(.borderedProminent)
            
            Button("Buttom") {
                
            }
            .font(.headline)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .controlSize(.small)
            .buttonStyle(.borderedProminent)
            
            Button("Buttom") {
                
            }
            .font(.headline)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .controlSize(.mini)
 //           .buttonStyle(.borderless)
            .buttonStyle(.borderedProminent)
        }
    }
}

struct ButtonStyleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleBootcamp()
            .preferredColorScheme(.dark)
    }
}
