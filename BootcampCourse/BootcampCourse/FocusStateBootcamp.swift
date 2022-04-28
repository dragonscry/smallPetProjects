//
//  FocusStateBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 28.04.2022.
//

import SwiftUI

struct FocusStateBootcamp: View {
    
    enum OnboardingFields: Hashable {
        case username
        case password
    }
    
    //   @FocusState private var usernameInFocus: Bool
    @State private var username : String = ""
    //   @FocusState private var passwordInFocus: Bool
    @State private var password : String = ""
    
    @FocusState private var fieldInFocus: OnboardingFields?
    
    
    var body: some View {
        VStack(spacing: 30) {
            TextField("Add your name here ...", text: $username)
            //              .focused($usernameInFocus)
                .focused($fieldInFocus, equals: .username)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
            
            TextField("Add your password here ...", text: $password)
            //.focused($passwordInFocus)
                .focused($fieldInFocus, equals: .password)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
            
            Button("SIGN UP") {
                let usernameIsValid = !username.isEmpty
                let passwordIsValid = !password.isEmpty
                
                if usernameIsValid && passwordIsValid {
                    print("SIGN UP")
                } else if usernameIsValid {
                    fieldInFocus = .password
                    //                    usernameInFocus = false
                    //                    passwordInFocus = true
                } else {
                    fieldInFocus = .username
                    //                    usernameInFocus = true
                    //                    passwordInFocus = false
                }
            }
            //
            //            Button("TOGGLE FOCUS STATE") {
            //                usernameInFocus.toggle()
            //            }
        }
        .padding(40)
        //        .onAppear{
        //          DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        //            self.usernameInFocus = true
        //      }
        //  }
    }
}

struct FocusStateBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FocusStateBootcamp()
    }
}
