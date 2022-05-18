//
//  ContentView.swift
//  CalendarWithHours
//
//  Created by Denys on 16.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var today = Date.now
    
    var body: some View {
        VStack {
            HStack{
                DatePicker("", selection: $today)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
