//
//  Temperature.swift
//  
//
//  Created by Евгений Кириллов on 21.08.2021.
//

import Foundation

/// Various temperature data
struct Temperature: Decodable {
    
    /// Min daily temperature. Unit: Celsius
    let min: Double?
    
    /// Max daily temperature. Unit: Celsius
    let max: Double?
    
    /// Morning temperature. Unit: Celsius
    let morn: Double
    
    /// Day temperature. Unit: Celsius
    let day: Double
    
    /// Evening temperature. Unit: Celsius
    let eve: Double
    
    /// Night temperature. Unit: Celsius
    let night: Double
}
