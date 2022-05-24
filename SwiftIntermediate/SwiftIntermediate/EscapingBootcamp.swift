//
//  EscapingBootcamp.swift
//  SwiftIntermediate
//
//  Created by Denys on 24.05.2022.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    @Published var text: String = "Hello"
    
    func getData() {
        downloadData5 { [weak self] (returnedResult) in
            self?.text = returnedResult.data
        }
    }
    
    func downloadData() -> String{

        return "New Data"
    }
    
    func downloadData2(completionHandler: (_ data: String) -> ()) {
        completionHandler("New data222!")
        
    }
    
    func downloadData3(completionHandler: @escaping (_ data: String) -> ()) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completionHandler("New data333!")
        }
    }
    
    func downloadData4(completionHandler: @escaping (DownloadResult) -> ()) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let result = DownloadResult(data: "New Data 444")
            completionHandler(result)
        }
    }
    
    func downloadData5(completionHandler: @escaping DownloadCompletion) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let result = DownloadResult(data: "New Data 555")
            completionHandler(result)
        }
    }
}

struct DownloadResult {
    let data: String
}

typealias DownloadCompletion = (DownloadResult) -> ()

struct EscapingBootcamp: View {
    
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

struct EscapingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        EscapingBootcamp()
    }
}
