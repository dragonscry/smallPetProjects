//
//  InitBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 30.03.2022.
//

import SwiftUI

struct InitBootcamp: View {
    
    let backGroundColor: Color
    let count: Int
    let title: String
    
    init(backGroundColor: Color, count: Int, title: String) {
        self.backGroundColor = backGroundColor
        self.count = count
        self.title = title
    }
    
    init(count: Int, fruit: Fruit) {
        self.count = count
        
        switch fruit {
        case .apple:
            self.backGroundColor = .red
            self.title = "Apples"
        case .orange:
            self.backGroundColor = .orange
            self.title = "Oranges"
        }
    }
    
    init() {
        self.backGroundColor = .red
        self.count = 8
        self.title = "Apples"
    }
    
    var body: some View {
        VStack(spacing: 12){
            Text("\(count)")
                .font(.largeTitle)
                .foregroundColor(Color.white)
                .underline()
            Text(title)
                .font(.headline)
                .foregroundColor(Color.white)
        }
        .frame(width: 150, height: 150)
        .background(backGroundColor)
        .cornerRadius(10)
    }
}

enum Fruit {
    case apple
    case orange
}

struct InitBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        InitBootcamp(count: 8, fruit: .orange)
    }
}
