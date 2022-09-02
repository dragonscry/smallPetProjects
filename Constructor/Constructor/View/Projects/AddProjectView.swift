//
//  AddProjectView.swift
//  Constructor
//
//  Created by Denys on 13.07.2022.
//

import SwiftUI

struct AddProjectView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var projectVM: ProjectsDataManager
    @EnvironmentObject var projectVMNew: ProjectViewModel
    @State var name = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    DefaultPhotoView()
                    TextField("Type Project Name", text: $name)
                        .underlineTextField()
                }
                .padding(.bottom, 20)
                
                Button {
                    projectVMNew.unselectAllProjects()
                    projectVMNew.addProject(name: name)
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    DefaultButton(text: "Save")
                }
                
                Spacer()
                
            }
            .padding(.horizontal)
            .navigationTitle("Add Project")
        }
    }
}

struct AddProjectView_Previews: PreviewProvider {
    static var previews: some View {
        AddProjectView()
    }
}
