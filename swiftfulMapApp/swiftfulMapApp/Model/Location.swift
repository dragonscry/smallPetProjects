//
//  Location.swift
//  swiftfulMapApp
//
//  Created by Denys on 30.04.2022.
//

import Foundation
import MapKit

struct Location : Identifiable {
    
    let name : String
    let cityName : String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var id : String {
        name + cityName
    }
}
