//
//  ConstructorView.swift
//  Constructor
//
//  Created by Denys on 23.05.2022.
//

import SwiftUI

struct ConstructorView: View {
    
    @EnvironmentObject var constructorModelView: ConstructorModelView
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct ConstructorView_Previews: PreviewProvider {
    static var previews: some View {
        ConstructorView()
            .environmentObject(ConstructorModelView())
    }
}
