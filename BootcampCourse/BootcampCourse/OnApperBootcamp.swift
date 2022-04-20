//
//  OnApperBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 20.04.2022.
//

import SwiftUI

struct OnApperBootcamp: View {
    
    @State var myText: String = "Start text"
    @State var count: Int = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(myText)
                LazyVStack {
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: 25).frame( height: 200)
                            .padding()
                            .onAppear {
                                count += 1
                            }
                    }
                }
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    myText = "This new text"
                }
            })
            .onDisappear(perform: {
                myText = "Ending Text"
            })
            .navigationTitle("On Appear: \(count)")
        }
    }
}

struct OnApperBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        OnApperBootcamp()
    }
}
