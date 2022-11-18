//
//  GameView.swift
//  SwiftQuiz
//
//  Created by Denys on 18.11.2022.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                
                HStack(spacing: 30) {
                    ForEach(cards, id: \.self) { card in
                        CardView(eng: card.eng, ukr: card.ukr)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

struct Card: Hashable {
    let eng: String
    let ukr: String
}

let cards = [Card(eng: "Car", ukr: "Машина"), Card(eng: "Cheap", ukr: "Дешевий"), Card(eng: "Expensive", ukr: "Дорогий")]
