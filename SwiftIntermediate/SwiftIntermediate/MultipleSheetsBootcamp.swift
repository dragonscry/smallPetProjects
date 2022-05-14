//
//  MultipleSheetsBootcamp.swift
//  SwiftIntermediate
//
//  Created by Denys on 14.05.2022.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

struct MultipleSheetsBootcamp: View {
    
    @State var selectedModel: RandomModel? = nil
//    @State var showSheet: Bool = false
//    @State var showSheet2: Bool = false
    
    //1 use a binding
    //2 use a multiple .sheets
    //3 use $item
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 20) {
                
                ForEach(0..<50) { index in
                    Button("Button \(index)") {
                        selectedModel = RandomModel(title: String(index))
        //                showSheet.toggle()
                        
                    }
                }
                
                

    //            .sheet(isPresented: $showSheet) {
    //                NextScreen(selectedModel: RandomModel(title: "ONE"))
    //            }
    //            Button("Button 2") {
    //                selectedModel = RandomModel(title: "TWO")
    ////                showSheet2.toggle()
    //            }
    //            .sheet(isPresented: $showSheet2) {
    //                NextScreen(selectedModel: RandomModel(title: "TWO"))
    //            }
            }
            .sheet(item: $selectedModel) { model in
                NextScreen(selectedModel: model)
        }
        }
        .frame(maxWidth: .infinity)
//        .sheet(isPresented: $showSheet) {
//           NextScreen(selectedModel: selectedModel)
//            switch selectedIndex {
//            case 1:
//                NextScreen(selectedModel: RandomModel(title: "ONE"))
//            case 2:
//                NextScreen(selectedModel: RandomModel(title: "TWO"))
//            default:
//                NextScreen(selectedModel: RandomModel(title: "DEFAULT"))
//            }
        }
}

struct NextScreen: View {
    
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct MultipleSheetsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetsBootcamp()
    }
}
