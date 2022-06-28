//
//  ButtonsView.swift
//  Constructor
//
//  Created by Denys on 27.06.2022.
//

import SwiftUI

struct ButtonsView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


// Default Save Button Label
struct SaveButtonLabel: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.black)
            Text("SAVE")
                .foregroundColor(.black)
        }
        .frame(width: 80, height: 40)
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        SaveButtonLabel()
    }
}
