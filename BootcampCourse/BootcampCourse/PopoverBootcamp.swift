//
//  PopoverBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 11.04.2022.
//

import SwiftUI

extension AnyTransition {
    static var slideBootcamp : AnyTransition {
        AnyTransition.slide
    }
}

struct PopoverBootcamp: View {
    
    @State var showNewScreen: Bool = false
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            VStack {
                    Button("Button") {
                        withAnimation(.spring()) {
                            showNewScreen.toggle()
                        }
                    }
                    .font(.largeTitle)
                    
                    Spacer()
            }
            // METHOD 1 SHEET
           // .sheet(isPresented: $showNewScreen, content: {NewScreen()})
            //METHOD 2 - TRANSITOON
            
//            ZStack {
//                if showNewScreen {
//                    NewScreen(showNewScreen: $showNewScreen)
//    //                       .cornerRadius(30)
//                        .padding(.top, 100)
//                        .transition(.move(edge: .bottom))
//                }
//            }//.zIndex(2)
            
            //METHOD 3 - ANIMATION OFFSET
            
            NewScreen(showNewScreen: $showNewScreen)
                .padding(.top, 100)
                .offset(y: showNewScreen ? 0 : UIScreen.main.bounds.height)

        }
    }
}

//There are some issues with .transition in swiftUI. The best
//solution its use withAnimation and cover function which change value.

struct NewScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var showNewScreen: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Color.purple.edgesIgnoringSafeArea(.all)
            
            Button(action: {
//                presentationMode.wrappedValue.dismiss()
                withAnimation(.spring()) {
                    showNewScreen.toggle()
                }
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
                
            })
            
        }
    }
}

struct PopoverBootcamp_Previews: PreviewProvider {
    static var previews: some View {
            PopoverBootcamp()
    }
}
