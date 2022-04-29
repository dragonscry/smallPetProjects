//
//  AddView.swift
//  TodoList
//
//  Created by Denys on 28.04.2022.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    @EnvironmentObject var listViewModel : ListViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State var alertTitle = ""
    @State var showAlert = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here ... ", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖊")
        .alert(alertTitle, isPresented: $showAlert) {
            Button(role: .cancel) {
                
            } label: {
                Text("OK")
            }

        }
    }
    
    func saveButtonPressed() {
        
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long! 🙃"
            showAlert.toggle()
            return false
        }
        return true
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .preferredColorScheme(.dark)
        .environmentObject(ListViewModel())
    }
}
