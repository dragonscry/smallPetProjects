//
//  TestView.swift
//  Pokedex
//
//  Created by Denys on 11.04.2022.
//

import SwiftUI

struct TestView: View {
    
    @State var show = false
    
    var body: some View {
        ZStack {
            if !show {
                Text("View Transition")
                    .padding()
                    .background(Capsule().stroke())
            } else {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.blue)
                    .padding()
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                show.toggle()
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
