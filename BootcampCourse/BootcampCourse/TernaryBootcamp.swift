//
//  TernaryBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 09.04.2022.
//

import SwiftUI

struct TernaryBootcamp: View {
    
    @State var isRectange = true
    @State var isStartingState: Bool = false
    
    var body: some View {
        VStack {
            Button("Button"){
                isRectange.toggle()
                isStartingState.toggle()
            }
            
            RoundedRectangle(cornerRadius: 25)
                .fill(isStartingState ? Color.red : Color.blue)
                .frame(width: isRectange ? 200 : 100, height: 100)
            
            Spacer()
        }
    }
}

struct TernaryBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TernaryBootcamp()
    }
}
