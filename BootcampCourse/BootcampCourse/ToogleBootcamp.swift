//
//  ToogleBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 16.04.2022.
//

import SwiftUI

struct ToogleBootcamp: View {
    
    @State var toogleIsOn = false
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Status:")
                Text(toogleIsOn ? "Online" : "Offline")
                    .font(.title)
            }
            
            Toggle(isOn: $toogleIsOn, label: {
                Text("Label")
            })
            .padding()
            .toggleStyle(SwitchToggleStyle(tint: Color.orange))
            Spacer()
        }
    }
}

struct ToogleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ToogleBootcamp()
    }
}
