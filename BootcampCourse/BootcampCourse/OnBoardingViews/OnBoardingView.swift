//
//  OnBoardingView.swift
//  BootcampCourse
//
//  Created by Denys on 22.04.2022.
//

import SwiftUI

struct OnBoardingView: View {
    
    // Onboarding states:
    /*
     0 - Welcome Screen
     1 - Add name
     2 - Add age
     3 - Add gender
     */
    @State var onBoardingState: Int = 0
    
    let transition : AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    
    @State var name: String = ""
    @State var age: Double = 50
    @State var gender: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            // content
            ZStack {
                switch onBoardingState {
                case 0:
                    welcomeSection
                        .transition(transition)
                case 1:
                    addNameSection
                        .transition(transition)
                case 2:
                    addAgeSection
                        .transition(transition)
                case 3:
                    addGenderSection
                        .transition(transition)
                    
                default:
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.green)
                }
            }
            
            
            
            // buttons
            VStack {
                Spacer()
                bottomButton
                
            }
            .padding(30)
        }
        .alert(alertTitle, isPresented: $showAlert) {
            Button("OK", role: .cancel){}
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
            .background(Color.purple)
    }
}

// MARK: COMPONENTS

extension OnBoardingView {
    
    private var bottomButton: some View {
        Text(onBoardingState == 0 ? "SIGN UP" : onBoardingState == 3 ? "FINISH" : "NEXT")
            .font(.headline)
            .foregroundColor(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .animation(nil, value: onBoardingState)
            .onTapGesture {
                handleNextButtonPresser()
            }
    }
    
    private var welcomeSection: some View {
        VStack(spacing: 40) {
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
            Text("Find your match.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .overlay(
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y : 5)
                        .foregroundColor(.white),
                    alignment: .bottom
                )
            Text("This is the #1 app for finding your match online! In this tutorial we are practicing using AppStorage and other SwiftUI techniques")
                .fontWeight(.medium)
                .foregroundColor(.white)
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }
    
    private var addNameSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            TextField("Your name here...", text: $name)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(.white)
                .cornerRadius(10)
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addAgeSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your age?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Text("\(String(format: "%.0f", age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Slider(value: $age, in: 18...100, step: 1).tint(.white)
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addGenderSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your age?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            HStack {
                Text("Select a gender: ")
                    .font(.headline)
                    .foregroundColor(.purple)
                    .frame(height: 55)
                
                Picker(selection: $gender) {
                    Text("Male").tag("Male")
                    Text("Female").tag("Fema;e")
                    Text("Non-Binary").tag("Non-Binary")
                } label: {
                    Text("Selct a gender")
                }
                .pickerStyle(MenuPickerStyle())
            }
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(10)
            
            
            Spacer()
            Spacer()
        }
        .padding(30)
    }
}

//MARK: FUNCTIONS
extension OnBoardingView {
    
    func handleNextButtonPresser() {
        
        //CHECK INPUTS
        switch onBoardingState {
        case 1:
            guard name.count >= 3 else {
                showAlert(title: "Your name must be at least 3 characters long!")
                return
            }
        default:
            break
        }
        
        //GO TO NEXT SECTION
        if onBoardingState == 3 {
            // sign in
        } else {
            withAnimation(.spring()) {
                onBoardingState += 1
            }
        }
    }
    
    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
}
