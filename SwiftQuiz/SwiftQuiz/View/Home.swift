//
//  Home.swift
//  SwiftQuiz
//
//  Created by Denys on 18.11.2022.
//

import SwiftUI

struct Home: View {
    
    @State var options = categories // 1
    @State var selectedItem = "All" // 2
    
    var body: some View {
        NavigationStack {
            VStack {
                
                HStack {
                    Spacer()
                    Image(systemName: "plus")
                    Image(systemName: "list.dash")
                }
                .font(.system(size: 30))
                .padding(.horizontal, 10)
                
                Spacer()
                
                Picker("Pick a language", selection: $selectedItem) { // 3
                    ForEach(options, id: \.self) { item in // 4
                        Text(item) // 5
                    }
                }
                .padding(.horizontal, 200)
                .pickerStyle(.wheel)
                ZStack {
                    NavigationLink(destination: GameView()) {
                        ButtonView
                    }
                    
                }
                Spacer()
                
            }
        }
        .toolbar(.hidden)
    }
    
    var ButtonView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: 200, height: 100)
            Text("Start Game")
                .foregroundColor(.white)
                .font(.system(size: 30))
        }
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
