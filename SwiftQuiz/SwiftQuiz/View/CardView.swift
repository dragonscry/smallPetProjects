//
//  CardView.swift
//  SwiftQuiz
//
//  Created by Denys on 18.11.2022.
//

import SwiftUI

struct CardView: View {
    
    let eng: String
    let ukr: String
    @State var backDegree: CGFloat = 0.0
    @State var frontDegree: CGFloat = -90.0
    let durationAndDelay : CGFloat = 0.3
    @State var isFlipped = false
    
    var body: some View {
        ZStack {
            CardSide(text: eng, degree: frontDegree)
            CardSide(text: ukr, degree: backDegree)
        }
        .onTapGesture {
            flipCard()
        }
    }
    
    func flipCard() {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(eng: "Car", ukr: "Машина")
    }
}

struct CardSide: View {
    
    let text: String
    let degree: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: .init(width: 20, height: 20))
                .fill(Color.blue)
                .frame(width: 300,height: 200)
            Text(text)
                .font(.system(size: 50, weight: .black))
                .foregroundColor(.white)
        }
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}
