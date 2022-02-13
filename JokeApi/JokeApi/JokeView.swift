//
//  JokeView.swift
//  JokeApi
//
//  Created by Denys on 12.02.2022.
//

import SwiftUI

struct JokeView: View {
    @Binding var joke: Joke?
    let defaultText = "To show a joke click on button below"
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                if joke == nil {
                    Text(defaultText)
                } else if joke!.joke != nil {
                    Text("\(joke!.joke!)")
                }
                else {
                    Text("\(joke!.setup!)")
                    Text("\(joke!.delivery!)")
                }
            }
            .foregroundColor(Color.white)
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            .padding(50)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            
        }
    }
}
//
//struct JokeView_Previews: PreviewProvider {
//    static var previews: some View {
//        JokeView()
//    }
//}
