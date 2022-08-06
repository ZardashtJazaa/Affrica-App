//
//  LocationsModel.swift
//  Africa
//
//  Created by Zardasht on 8/1/22.
//

import Foundation
import MapKit

struct NationalParkLocations: Identifiable , Codable {
    var id: String
    var name:String
    var image:String
    var latitude:Double
    var longitude:Double
    
    var thumbLocations: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
