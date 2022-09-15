//
//  String.swift
//  SwiftfulCrypto
//
//  Created by Denys on 15.09.2022.
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
