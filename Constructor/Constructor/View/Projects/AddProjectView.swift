//
//  AddProjectView.swift
//  Constructor
//
//  Created by Denys on 13.07.2022.
//

import SwiftUI

struct AddProjectView: View {
    
    @Environment(\.presentationMode) var presentationMode
    //@EnvironmentObject var coreDataVM: CoreDataRelationshipViewModel
    @EnvironmentObject var projectVM: ProjectsViewModel
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
                    projectVM.unselectAllProject()
                    projectVM.addProject(name: name)
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    SaveButtonLabel()
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
