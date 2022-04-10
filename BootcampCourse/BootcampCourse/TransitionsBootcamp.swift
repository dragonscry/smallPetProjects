//
//  TransitionsBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 10.04.2022.
//

import SwiftUI

struct TransitionsBootcamp: View {
    
    @State var showView: Bool = false
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            VStack {
                Button("Button") {
                    showView.toggle()
                }
                Spacer()
                
            }
            
            if showView {
                RoundedRectangle(cornerRadius: 30)
                
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                //                       .opacity(showView ? 1 : 0)
                    .transition(AnyTransition.scale.animation(.easeInOut))
                   // .animation(Animation.easeInOut, value: showView)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TransitionsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TransitionsBootcamp()
    }
}
