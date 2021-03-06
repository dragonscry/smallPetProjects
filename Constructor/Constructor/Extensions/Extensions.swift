//
//  Extensions.swift
//  Constructor
//
//  Created by Denys on 14.06.2022.
//

import Foundation
import SwiftUI


extension Color {
    static let darkPink = Color(red: 208 / 255, green: 45 / 255, blue: 208 / 255)
}


extension View {
    func underlineTextField() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle().fill(Color.gray).frame(height: 2).padding(.top, 35))
            .padding(10)
    }
}
