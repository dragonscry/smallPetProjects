//
//  SubmitTextField.swift
//  BootcampCourse
//
//  Created by Denys on 28.04.2022.
//

import SwiftUI

struct SubmitTextField: View {
    
    @State private var text: String = ""
    
    var body: some View {
        TextField("Placeholder...", text: $text)
            .submitLabel(.route)
            .onSubmit {
                print("something")
            }
        TextField("Placeholder...", text: $text)
            .submitLabel(.next)
            .onSubmit {
                print("something")
            }
        TextField("Placeholder...", text: $text)
            .submitLabel(.search)
            .onSubmit {
                print("something")
            }
    }
}

struct SubmitTextField_Previews: PreviewProvider {
    static var previews: some View {
        SubmitTextField()
    }
}
