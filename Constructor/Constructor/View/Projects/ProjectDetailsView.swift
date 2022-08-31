//
//  ProjectDetailsView.swift
//  Constructor
//
//  Created by Denys on 13.07.2022.
//

import SwiftUI

struct ProjectDetailsView: View {
    
    //@EnvironmentObject var coreDataVM: CoreDataRelationshipViewModel
    @EnvironmentObject var projectVM: ProjectsDataManager
    @Environment(\.presentationMode) var presentationMode
    var project: ProjectEntity
    @State var name = ""
    
    var body: some View {
        VStack {
            HStack {
                DefaultPhotoView()
                VStack {
                    TextField(project.name ?? "", text: $name)
                        .underlineTextField()
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 50)
            
            Button {
                projectVM.updateProject(project: project, name: name)
                presentationMode.wrappedValue.dismiss()
            } label: {
                DefaultButton(text: "Save")
            }
            
            Spacer()
        }
        .onAppear(perform: defaultValues)
    }
    
    func defaultValues() {
        self.name = project.name ?? ""
    }
}

//struct ProjectDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectDetailsView()
//    }
//}
