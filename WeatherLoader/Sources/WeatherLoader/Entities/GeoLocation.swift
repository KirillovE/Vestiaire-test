//
//  GeoLocation.swift
//  
//
//  Created by Евгений Кириллов on 21.08.2021.
//

import Foundation

/// Geo location of some point
struct GeoLocation: Decodable {
    
    /// Geo location, longitude
    let lon: Double
    
    /// Geo location, latitude
    let lat: Double
}
