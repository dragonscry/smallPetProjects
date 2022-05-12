//
//  ScrollViewReaderBootcamp.swift
//  SwiftIntermediate
//
//  Created by Denys on 12.05.2022.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    
    @State var scrollToIndex : Int = 0
    @State var cardNumber : String = ""
    
    var body: some View {
        VStack {
            
            TextField("Enter a number here ...", text: $cardNumber)
                .frame(height: 55)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("Scroll Now") {
                withAnimation(.spring()) {
                    if let index = Int(cardNumber) {
                        scrollToIndex = index
                    }
                }
                
            }
            
            
            ScrollView {
                ScrollViewReader { proxy in
                    
                    ForEach(0..<50) { index in
                        Text("THIS IS NUMBER IS \(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) { value in
                        withAnimation(.spring()){
                            proxy.scrollTo(value, anchor: .top)
                        }
                    }
                }

            }
        }
    }
}

struct ScrollViewReaderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderBootcamp()
    }
}
