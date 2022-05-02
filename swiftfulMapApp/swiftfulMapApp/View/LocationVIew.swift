//
//  LocationVIew.swift
//  swiftfulMapApp
//
//  Created by Denys on 02.05.2022.
//

import SwiftUI
import MapKit



struct LocationView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(LocationsViewModel())
    }
}
