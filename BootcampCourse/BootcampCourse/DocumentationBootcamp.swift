//
//  DocumentationBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 20.04.2022.
//

import SwiftUI

struct DocumentationBootcamp: View {
    
    //MARK: PROPERTIES
    
    @State var data: [String] = ["apples", "oranges", "bananas"]
    @State var showAlert: Bool = false
    
    
    //MARK: BODY
    
    /* Working copy ...
    Make some tools */
    
    var body: some View {
        NavigationView { //START: NAV
            ZStack {
                // background
                Color.red.ignoresSafeArea()
                
                // foreground
                foregroundLayer
                .navigationTitle("Documentation Bootcamp")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button("ALERT"){
                            showAlert.toggle()
                        }
                    }
                }
                .alert("Alert", isPresented: $showAlert, actions: {
                    Button("DONE") {
                        
                    }
                    Button("DO IT") {
                        
                    }
                    Button(" JUST DO IT") {
                        
                    }

            })
            }
        } //END: NAV
    }
    
    //MARK: FUNCTIONS
    
    /// Increment number
    ///
    ///This function increment Number
    ///```
    ///increment(numb: 5) -> 6
    ///```
    ///
    /// - Warning: Too simple
    /// - Parameter numb: number which will be increment
    /// - Returns: return increment number
    func increment(numb: Int) -> Int {
        return numb + 1
    }
    
    
    /// This is foregroundLayer that holds ScrollView
    private var foregroundLayer: some View {
        ScrollView { //START: SCROLLV
            Text("Hello")
            ForEach(data, id: \.self){ fruit in
                Text(fruit.capitalized)
                    .font(.headline)
            }
        } //END: SCROLLV
    }
}


//MARK: PREVIEW
struct DocumentationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DocumentationBootcamp()
    }
}
