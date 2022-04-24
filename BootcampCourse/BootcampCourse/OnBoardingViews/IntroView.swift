//
//  IntroView.swift
//  BootcampCourse
//
//  Created by Denys on 22.04.2022.
//

import SwiftUI

struct IntroView: View {
    
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        ZStack {
            //background
            RadialGradient(gradient: Gradient(colors:[Color.purple, Color.purple.opacity(0.8)]), center: .topLeading, startRadius: 5, endRadius: UIScreen.main.bounds.height).ignoresSafeArea()
            
            //if user signed in
            //profile view
            //else
            //onboarding view
            
            if currentUserSignedIn {
                Text("Profile View")
            }
            else {
                OnBoardingView()
            }
            
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
