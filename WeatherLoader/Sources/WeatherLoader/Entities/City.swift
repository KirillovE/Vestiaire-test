//
//  City.swift
//  
//
//  Created by Евгений Кириллов on 21.08.2021.
//

import Foundation

/// Parameters of specific city including name, coordinates, etc
struct City: Decodable {
    
    /// City ID
    let id: Int
    
    /// City name
    let name: String
    
    /// City geo location
    let coord: GeoLocation
    
    /// Country code (GB, JP etc.)
    let country: String
    
    /// Shift in seconds from UTC
    let timezone: Int
}
