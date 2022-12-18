//
//  ContentView.swift
//  ChatGPTmakeMeSwiftUIThings
//
//  Created by Denys on 15.12.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RainView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RainView: View {
    
    @State private var rainDrops: [RainDrop] = []
    
    var body: some View {
        ZStack {
            // Add a background color to the view
            Color.black
            
            // Add the raindrop shapes to the view using ForEach
            ForEach(rainDrops, id: \.self) { rainDrop in
                rainDrop.shape
                    .offset(x: rainDrop.position.width, y: rainDrop.position.height)
            }
        }
        .onAppear {
            // Add a new raindrop to the array every second
            Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
                self.rainDrops.append(RainDrop())
            }
        }
    }
}

struct RainDrop: Hashable {
    static func == (lhs: RainDrop, rhs: RainDrop) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id = UUID().uuidString
    
    
    let shape: some View = Rectangle()
        .fill(Color.white)
        .frame(width: 3, height: 15)
    
    let position: CGSize
    
    init() {
        // Set the initial position of the raindrop at the top of the screen
        self.position = CGSize(width: .random(in: 0...375), height: .random(in: 0...375))
    }
}
