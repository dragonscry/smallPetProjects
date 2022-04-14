//
//  ActionSheetBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 14.04.2022.
//

import SwiftUI

struct ActionSheetBootcamp: View {
    
    @State var showActionSheet: Bool = false
    @State var actionSheetOption: ActionSheetOption = .isOtherPost
    
    enum ActionSheetOption {
        case isMyPost
        case isOtherPost
    }
    
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 30, height: 30)
                Text("@username")
                Spacer()
                Button(action: {
                    actionSheetOption = .isOtherPost
                    showActionSheet.toggle()
                }, label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                })
            }
            .padding(.horizontal)
            
            Rectangle()
                .aspectRatio(1.0, contentMode: .fit)
        }
        .confirmationDialog("Title", isPresented: $showActionSheet, actions: {
            Button("Empty Trash", role: .destructive) {
                
            }
            Button("Cancel", role: .cancel) {
                
            }
        })
    }
}


struct ActionSheetBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetBootcamp()
    }
}
