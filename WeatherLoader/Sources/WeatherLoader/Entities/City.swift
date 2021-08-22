//
//  City.swift
//  
//
//  Created by Евгений Кириллов on 21.08.2021.
//

import Foundation

/// Parameters of specific city including name, coordinates, etc
public struct City: Decodable {
    
    /// City ID
    public let id: Int
    
    /// City name
    public let name: String
    
    /// City geo location
    public let coord: GeoLocation
    
    /// Country code (GB, JP etc.)
    public let country: String
    
    /// Shift in seconds from UTC
    public let timezone: Int
}
