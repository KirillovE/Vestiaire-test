//
//  WeatherFields.swift
//  
//
//  Created by Евгений Кириллов on 21.08.2021.
//

import Foundation

/// Fields in API response
public struct WeatherFields: Decodable {
    
    /// City of forecast
    public let city: City
    
    /// A number of days returned in the API response
    public let cnt: Int
    
    /// List of daily weather forecast
    public let list: [DailyWeather]
}
