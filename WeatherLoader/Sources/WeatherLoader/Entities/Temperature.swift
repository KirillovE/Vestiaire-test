//
//  Temperature.swift
//  
//
//  Created by Евгений Кириллов on 21.08.2021.
//

import Foundation

/// Various temperature data
///
/// Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit
public struct Temperature: Decodable {
    
    /// Min daily temperature. Unit: Celsius
    public let min: Double?
    
    /// Max daily temperature. Unit: Celsius
    public let max: Double?
    
    /// Morning temperature. Unit: Celsius
    public let morn: Double
    
    /// Day temperature. Unit: Celsius
    public let day: Double
    
    /// Evening temperature. Unit: Celsius
    public let eve: Double
    
    /// Night temperature. Unit: Celsius
    public let night: Double
    
}
