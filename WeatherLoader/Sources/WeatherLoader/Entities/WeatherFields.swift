//
//  WeatherFields.swift
//  
//
//  Created by Евгений Кириллов on 21.08.2021.
//

import Foundation

/// Fields in API response
struct WeatherFields: Decodable {
    
    /// City of forecast
    let city: City
    
    /// A number of days returned in the API response
    let cnt: Int
    
    /// List of daily weather forecast
    let list: [DailyWeather]
}
