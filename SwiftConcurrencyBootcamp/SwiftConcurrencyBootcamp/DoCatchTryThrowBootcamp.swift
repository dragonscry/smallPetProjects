//
//  DoCatchTryThrowBootcamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Denys on 21.09.2022.
//

import SwiftUI

//do catch
//try
//throws

class DoCatchTryThrowBootcampManager {
    
    let isActive: Bool = true
    
    func getTitle() -> (title: String?, error: Error?) {
        if isActive {
            return ("New Text", nil)
        } else {
            return (nil, URLError(.badURL))
        }
    }
    
    func getTitle2() -> Result<String, Error> {
        if isActive {
            return .success("New Text")
        } else {
            return .failure(URLError(.appTransportSecurityRequiresSecureConnection))
        }
    }
    
    func getTitle3() throws -> String {
        if isActive {
            return "New Text"
        } else {
            throw URLError(.badServerResponse)
        }
    }
    
    func getTitle4() throws -> String {
        if isActive {
            return "FINAL TEXT"
        } else {
            throw URLError(.badServerResponse)
        }
    }
}

class DoCatchTryThrowBootcampViewModel: ObservableObject {
    
    var manager = DoCatchTryThrowBootcampManager()
    
    @Published var text: String = "Starting text."
    
    func fetchTitle() {
        /*
         let returnValue = manager.getTitle()
         
         if let newTitle = returnValue.title {
         self.text = newTitle
         } else if let error = returnValue.error {
         self.text = error.localizedDescription
         }
         */
        
        /*
        let result = manager.getTitle2()
        
        switch result {
        case .success(let newTitle):
            self.text = newTitle
        case .failure(let error):
            self.text = error.localizedDescription
            
        }
         */
        
//        let newTitle = try? manager.getTitle3()
//        if let newTitle = newTitle {
//            self.text = newTitle
//        }
        
        
        do {
            let newTitle = try? manager.getTitle3()
            if let newTitle = newTitle {
                self.text = newTitle
            }

            let finalTitle = try manager.getTitle4()
            self.text = finalTitle
            
        } catch {
            self.text = error.localizedDescription
        }
         
    }
}


struct DoCatchTryThrowBootcamp: View {
    
    @StateObject private var viewModels = DoCatchTryThrowBootcampViewModel()
    
    var body: some View {
        VStack {
            
            Text(viewModels.text)
                .frame(width: 300, height: 300)
                .background(Color.blue)
                .onTapGesture {
                    viewModels.fetchTitle()
                }
        }
        
    }
}

struct DoCatchTryThrowBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DoCatchTryThrowBootcamp()
    }
}
