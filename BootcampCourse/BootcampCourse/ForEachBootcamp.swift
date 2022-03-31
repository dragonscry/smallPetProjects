//
//  ForEachBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 31.03.2022.
//

import SwiftUI

struct ForEachBootcamp: View {
    
    let data: [String] = ["one", "two", "three"]
    
    var body: some View {
        VStack {
//            ForEach(0..<10) { index in
//                ZStack {
//                    Circle()
//                        .fill(.blue)
//                    .frame(width: 30, height: 30)
//                    Text("\(index)")
//                        .foregroundColor(.white)
//                }
//            }
            ForEach(data.indices){ index in
                Text(data[index])
            }
        }
    }
}

struct ForEachBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ForEachBootcamp()
    }
}
