//
//  IfLetGuardBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 21.04.2022.
//

import SwiftUI

struct IfLetGuardBootcamp: View {
    
    @State var currentUserID: String? = nil
    @State var displayText: String? = nil
    @State var isLoading: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Here we are practising safe coding")
                
                if let text = displayText {
                    
                    Text(text)
                        .font(.title)
                }
                
                Text(displayText ?? "ERROR|||")
                    .font(.title)
                
                if isLoading {
                    ProgressView()
                }
                
                
                
                
                Spacer()
            }
            .navigationTitle("Save Coding")
            .onAppear {
                loadData2()
            }
        }
    }
    
    func loadData() {
        
        if let userId = currentUserID {
            
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                displayText = "This is new data! User id is: \(userId)"
                isLoading = false
            }
        } else {
            displayText = "Error there is no User ID"
        }
    }
    
    func loadData2() {
        guard let userID = currentUserID else {
            displayText = "Error. No User ID"
            return
        }
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            displayText = "This is new data! User id is: \(userID)"
            isLoading = false
            
        }
    }
}

struct IfLetGuardBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        IfLetGuardBootcamp()
    }
}
