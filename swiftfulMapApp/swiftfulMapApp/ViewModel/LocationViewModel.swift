//
//  LocationViewModel.swift
//  swiftfulMapApp
//
//  Created by Denys on 02.05.2022.
//

import Foundation

class LocationsViewModel : ObservableObject {
    @Published var locations: [Location]
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}
