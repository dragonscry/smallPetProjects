//
//  AppstorageBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 22.04.2022.
//

import SwiftUI

struct AppstorageBootcamp: View {
    
    
   // @State var currentUserName: String?
    @AppStorage("name") var currentUserName2: String?
    
    var body: some View {
        VStack(spacing: 20) {
            Text(currentUserName2 ?? "Add name here")
            
            Button("SAVE") {
                let name = "Emily"
                currentUserName2 = name
            }
        }

    }
}

struct AppstorageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AppstorageBootcamp()
    }
}
