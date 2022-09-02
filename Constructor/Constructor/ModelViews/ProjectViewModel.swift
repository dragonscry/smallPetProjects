//
//  ProjectViewModel.swift
//  Constructor
//
//  Created by Denys on 31.08.2022.
//

import Foundation
import Combine

class ProjectViewModel: ObservableObject {
    
    private let projectsData: ProjectsDataManager = ProjectsDataManager()
    private let productsData: ProductsDataManager = ProductsDataManager()
    private let itemsData: ItemsDataManager = ItemsDataManager()
    
    private var cansellables = Set<AnyCancellable>()
    
    @Published var projects: [ProjectEntity] = []
    @Published var products: [ProductEntity] = []
    @Published var items: [ItemEntity] = []
    
    private var selectedProject: ProjectEntity = ProjectEntity()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        
        projectsData.$projects
            .sink { projects in
                self.projects = projects
                if let selectedProject = projects.first(where: { $0.isSelected}) {
                    self.selectedProject = selectedProject
                }
            }
            .store(in: &cansellables)
        
        productsData.$products
            .combineLatest(projectsData.$projects)
            .map(filterProducts)
            .sink { [weak self] products in
                self?.products = products
            }
            .store(in: &cansellables)
        
        itemsData.$items
            .combineLatest(projectsData.$projects)
            .map(filterItems)
            .sink { [weak self] items in
                self?.items = items
            }
            .store(in: &cansellables)
        
    }
    
    private func filterProducts(products: [ProductEntity], projects: [ProjectEntity]) -> [ProductEntity] {
        guard let project = projects.first(where: { $0.isSelected }) else {return [ProductEntity]()}
        
        guard let projectProducts = project.products?.allObjects as? [ProductEntity]
        else {return [ProductEntity]()}
        
        return products.filter { product in
            projectProducts.contains(product)
        }
        
    }
    
    private func filterItems(items: [ItemEntity], projects: [ProjectEntity]) -> [ItemEntity] {
        guard let project = projects.first(where: { $0.isSelected }) else {return [ItemEntity]()}
        
        guard let projectItems = project.items?.allObjects as? [ItemEntity]
        else {return [ItemEntity]()}
        
        return items.filter { item in
            projectItems.contains(item)
        }
        
    }
    
    
    //MARK: Project Functions
    
    func addProject(name: String) {
        projectsData.addProject(name: name)
    }
    
    func unselectAllProjects() {
        projectsData.unselectAllProject()
    }
    
    func updateProject(project: ProjectEntity, name: String) {
        projectsData.updateProject(project: project, name: name)
    }
    
    func deleteProject(at indexSet: IndexSet) {
        projectsData.deleteProject(at: indexSet)
    }
    
    func saveProject(){
        projectsData.save()
    }
    
    //MARK: Item Functions
    
    func addItem(name:String, price: Float, description: String, dimension: String, project: ProjectEntity) {
        //
    }
    
    
    
    
}
