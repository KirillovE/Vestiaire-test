//
//  DailyWeather.swift
//  
//
//  Created by Евгений Кириллов on 21.08.2021.
//

import Foundation

/// Weather parameters in specific day
struct DailyWeather: Decodable {
    
    /// Time of data forecasted
    let dt: Int
    
    /// Time of sunrise
    let sunrise: Int
    
    /// Time of sunset
    let sunset: Int
    
    /// Temperature during the day
    let temp: Temperature
    
    /// Human perception of weather
    let feelsLike: Temperature
    
    /// Atmospheric pressure on the sea level, hPa
    let pressure: Int
    
    /// Humidity, %
    let humidity: Int
    
    /// Description of weather
    let weather: [Conditions]
    
    /// Wind speed. Unit: meter/sec
    let speed: Double
    
    /// Wind direction, degrees (meteorological)
    let deg: Int
    
    /// Wind gust. Unit: meter/sec
    let gust: Double
    
    /// Cloudiness, %
    let clouds: Int
    
    /// Probability of precipitation
    let pop: Double
    
    /// Precipitation volume, mm
    let rain: Double?
    
    /// Snow volume, mm
    let snow: Double?
}
