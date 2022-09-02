//
//  ProjectListView.swift
//  Constructor
//
//  Created by Denys on 13.07.2022.
//

import SwiftUI

struct ProjectListView: View {
    
    //@EnvironmentObject var coreDataVM: CoreDataRelationshipViewModel
    @EnvironmentObject var projectVM: ProjectsDataManager
    @EnvironmentObject var projectVMNew: ProjectViewModel
    @State var isAddingProject = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(projectVMNew.projects) { project in
                    NavigationLink {
                        ProjectDetailsView(project: project)
                    } label: {
                        HStack {
                            Text(project.name ?? "empty")
                            Spacer()
                            Text(project.isSelected ? "🟢" : "🔴")
                        }
                        .onTapGesture {
                            projectVMNew.unselectAllProjects()
                            project.isSelected = true
                            projectVMNew.saveProject()
                        }
                    }

                    

                }
                .onDelete(perform: projectVMNew.deleteProject)
            }
            .navigationTitle("All Projects")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.isAddingProject = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $isAddingProject) {
                        AddProjectView()
                    }

                }
            }
        }
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView()
    }
}
