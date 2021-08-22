//
//  WeatherError.swift
//  
//
//  Created by Евгений Кириллов on 21.08.2021.
//

/// API error representation
struct WeatherError: Error, CustomStringConvertible {
    let description: String
}

extension WeatherError: ExpressibleByStringLiteral {
    
    init(stringLiteral value: String) {
        description = value
    }
}
