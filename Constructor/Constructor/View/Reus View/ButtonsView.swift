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
            Text("SAVE")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(.blue)
                .cornerRadius(10)
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        SaveButtonLabel()
    }
}
