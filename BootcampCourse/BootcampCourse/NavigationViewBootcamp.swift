//
//  NavigationViewBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 12.04.2022.
//

import SwiftUI

struct NavigationViewBootcamp: View {
    var body: some View {
        NavigationView {
            ScrollView {
                
                NavigationLink("Hello", destination: MyOtherScreen())
                Text("Hi")
                Text("Bye")
            }
            .navigationTitle("All Inboxes")
            .navigationBarTitleDisplayMode(.automatic)
         //  .navigationBarHidden(true)
            .navigationBarItems(
                leading: HStack {
                    Image(systemName: "person.fill")
                    Image(systemName: "flame.fill")
                },
                trailing: NavigationLink(destination: MyOtherScreen(), label: {
                    Image(systemName: "gear")
                })).accentColor(.red)
        }
    }
}

struct MyOtherScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.orange.edgesIgnoringSafeArea(.all)
                .navigationTitle("Orange")
                .navigationBarHidden(true)
            VStack {
                Button("Button") {
                    presentationMode.wrappedValue.dismiss()
                }
                
                NavigationLink("Click Here") {
                    Text("3rd screen")
                }
            }
        }
    }
}

struct NavigationViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewBootcamp()
    }
}
