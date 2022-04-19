//
//  TabViewBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 19.04.2022.
//

import SwiftUI

struct TabViewBootcamp: View {
    
    @State var selectedTab: Int = 0
    
    let icons: [String] = [
        "heart.fill",
        "globe",
        "house.fill",
        "person.fill"
    ]
    
    var body: some View {
//        TabView(selection: $selectedTab) {
//
//            HomeView(tabNumber: $selectedTab)
//                .tabItem {
//                    Image(systemName: "house.fill")
//                    Text("Home")
//                }
//                .tag(0)
//            Text("Browse Tab")
//                .tabItem{
//                    Image(systemName: "globe")
//                    Text("Browse")
//                }
//                .tag(1)
//            Text("Profile Tab")
//                .tabItem{
//                    Image(systemName: "person.fill")
//                    Text("Profile")
//                }
//                .tag(2)
//        }
        
        TabView {
            ForEach(icons, id: \.self) { icon in
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .padding(30)
            }
//            RoundedRectangle(cornerRadius: 25)
//                .foregroundColor(.red)
//            RoundedRectangle(cornerRadius: 25)
//                .foregroundColor(.green)
//            RoundedRectangle(cornerRadius: 25)
//                .foregroundColor(.purple)
        }
        .background(
            RadialGradient(gradient: Gradient(colors: [Color.red, Color.blue]), center: .center, startRadius: 5, endRadius: 300)
        )
        .frame(height: 300)
        .tabViewStyle(PageTabViewStyle())
    }
}

struct TabViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TabViewBootcamp()
    }
}

struct HomeView: View {
    
    @Binding var tabNumber: Int
    
    var body: some View {
        ZStack {
            Color.red.edgesIgnoringSafeArea(.top)
            VStack {
                Text("Home Tab")
                    .font(.largeTitle)
                .foregroundColor(.white)
                
                Button(action: {
                    tabNumber = 2
                }) {
                    Text("Go to profile")
                        .foregroundColor(.white)
                        .padding()
                        .background(.blue)
                        .cornerRadius(10)
                }
            }
        }
    }
}
