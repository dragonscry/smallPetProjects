//
//  SwiftUIView.swift
//  BootcampCourse
//
//  Created by Denys on 06.04.2022.
//

import SwiftUI

struct StateBootcamp: View {
    
    @State var backgroundColor: Color = Color.green
    
    @State var count = 1
    
    var body: some View {
        ZStack{
            backgroundColor
                .ignoresSafeArea(.all)
            VStack(spacing: 20){
                Text("Title")
                    .font(.title)
                Text("Count: \(count)")
                    .font(.headline)
                    .underline()
                
                HStack(spacing: 20) {
                    Button("Button 1") {
                        self.backgroundColor = .red
                        self.count += 1
                    }
                    
                    Button("Button 2") {
                        self.backgroundColor = .purple
                        self.count *= 2
                    }
                }
            }
            .foregroundColor(.white)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        StateBootcamp()
    }
}
