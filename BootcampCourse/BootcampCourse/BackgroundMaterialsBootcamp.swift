//
//  BackgroundMaterialsBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 26.04.2022.
//

import SwiftUI

struct BackgroundMaterialsBootcamp: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack{
                //Text("Hi")
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 50, height: 4)
                    .padding()
                Spacer()
            }
            .frame(height: 350)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
        }
        .ignoresSafeArea()
        .background(
            Image("horizon")
        )
    }
}

struct BackgroundMaterialsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundMaterialsBootcamp()
    }
}
