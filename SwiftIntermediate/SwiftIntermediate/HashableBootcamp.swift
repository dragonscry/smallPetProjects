//
//  HashableBootcamp.swift
//  SwiftIntermediate
//
//  Created by Denys on 19.05.2022.
//

import SwiftUI

struct MODEL: Hashable {
//    let id = UUID().uuidString
    let title: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

struct HashableBootcamp: View {
    
    let data:[MODEL] = [MODEL(title: "ONE"), MODEL(title: "TWO"), MODEL(title: "THREE")]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                ForEach(data, id: \.self) { item in
                    Text(item.title)
                        .font(.headline)
                }
//                ForEach(data){ item in
//                    Text(item.title).font(.largeTitle)
//                }
            }
        }
    }
}

struct HashableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HashableBootcamp()
    }
}
