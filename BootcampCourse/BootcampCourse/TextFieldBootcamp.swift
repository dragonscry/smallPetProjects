//
//  TextFieldBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 16.04.2022.
//

import SwiftUI

struct TextFieldBootcamp: View {
    
    @State var textFieldText = ""
    @State var dataArray : [String] = []
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Placeholder", text: $textFieldText)
        //            .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(.gray.opacity(0.3))
                    .cornerRadius(10)
                    .foregroundColor(.red)
                    .font(.headline)
                
                
                
                Button(action: {
                    if textIsAppropriate() {
                        saveText()
                    }
                    
                }, label: {
                    Text("Save".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(textIsAppropriate() ? .blue : .gray)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.headline)
                })
                .disabled(!textIsAppropriate())
                
                ForEach(dataArray, id: \.self) { data in
                    Text(data)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("TextField Bootcamp!")
        }
    }
    
    func textIsAppropriate() -> Bool {
        //check text
        if textFieldText.count >= 3 {
            return true
        }
        
        return false
    }
    
    func saveText() {
        dataArray.append(textFieldText)
        textFieldText = ""
    }
}

struct TextFieldBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldBootcamp()
    }
}
