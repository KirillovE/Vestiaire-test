//
//  WeatherError.swift
//  
//
//  Created by Евгений Кириллов on 21.08.2021.
//

/// API error representation
public struct WeatherError: Error, CustomStringConvertible {
    public let description: String
}

extension WeatherError: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        description = value
    }
    
}
