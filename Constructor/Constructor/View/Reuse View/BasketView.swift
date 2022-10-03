//
//  BasketView.swift
//  Constructor
//
//  Created by Denys on 03.10.2022.
//

import SwiftUI

struct BasketView: View {
    @State var count = 1
    
    var height: CGFloat
    var width: CGFloat
    
    var body: some View {
        ZStack {
            Image(systemName: "cart")
                .resizable()
                .scaledToFit()
            Text("\(count)")
                .fontWeight(.bold)
                .font(.system(size: height/2.5))
                .foregroundColor(.white)
                .padding(.horizontal, 2)
                .background {
                    Capsule()
                        .fill(Color.red)
                }
                .offset(x: width/2, y: -height/2)

        }
        .frame(width: width, height: height)
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView(count: 99, height: 30, width: 30)
    }
}
