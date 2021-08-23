//
//  GeoLocation.swift
//  
//
//  Created by Евгений Кириллов on 21.08.2021.
//

import Foundation

/// Geo location of some point
public struct GeoLocation: Decodable {
    
    /// Geo location, longitude
    public let lon: Double
    
    /// Geo location, latitude
    public let lat: Double
    
}
