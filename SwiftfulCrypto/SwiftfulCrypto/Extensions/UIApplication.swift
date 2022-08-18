//
//  UIApplication.swift
//  SwiftfulCrypto
//
//  Created by Denys on 18.08.2022.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEdtitng() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
