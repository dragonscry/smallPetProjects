//
//  SheetsBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 10.04.2022.
//

import SwiftUI

struct SheetsBootcamp: View {
    
    @State var showSheet = false
    
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            
            Button(action: {
                showSheet.toggle()
            }, label: {
                Text("Button")
                    .padding()
                    .font(.headline)
                    .foregroundColor(.green)
                    .background(Color.white.cornerRadius(10))
                
            })
            .fullScreenCover(isPresented: $showSheet, content: {
                secondScreen()
            })
            .sheet(isPresented: $showSheet) {
                secondScreen()
            }
        }
    }
}

struct secondScreen : View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack (alignment: .topLeading) {
            Color.red.edgesIgnoringSafeArea(.all)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(20)
                
            })
            
        }
    }
}

struct SheetsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SheetsBootcamp()
    }
}
