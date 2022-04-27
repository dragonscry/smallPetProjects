//
//  BadgesBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 27.04.2022.
//

import SwiftUI

//LIST
//TabView

struct BadgesBootcamp: View {
    
    
    var body: some View {
        List{
            Text("Hello")
                .badge("NEW ITEM")
            Text("Hello")
            Text("Hello")
            Text("Hello")
            
        }
//        TabView {
//            Color.red
//                .tabItem {
//                    Image(systemName: "heart.fill")
//                    Text("Hello")
//                }
//                .badge(2)
//
//            Color.green
//                .tabItem {
//                    Image(systemName: "heart.fill")
//                    Text("Hello")
//                }
//                .badge("NEW")
//            Color.blue
//                .tabItem {
//                    Image(systemName: "heart.fill")
//                    Text("Hello")
//                }
//        }
    }
}

struct BadgesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BadgesBootcamp()
    }
}
