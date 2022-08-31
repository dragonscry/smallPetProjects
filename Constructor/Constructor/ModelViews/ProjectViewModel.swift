//
//  ProjectViewModel.swift
//  Constructor
//
//  Created by Denys on 31.08.2022.
//

import Foundation
import Combine

class ProjectViewModel: ObservableObject {
    
    private let projectData: ProjectsDataManager = ProjectsDataManager()
    
    private var cansellables = Set<AnyCancellable>()
    
    @Published var projects: [ProjectEntity] = []
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        
        projectData.$projects
            .sink { projects in
                self.projects = projects
            }
            .store(in: &cansellables)
        
    }
    
    func addProject(name: String) {
        projectData.addProject(name: name)
    }
    
    func updateProject(project: ProjectEntity, name: String) {
        projectData.updateProject(project: project, name: name)
    }
    
    func deleteProject(at indexSet: IndexSet) {
        projectData.deleteProject(at: indexSet)
    }
    
    
    
}
