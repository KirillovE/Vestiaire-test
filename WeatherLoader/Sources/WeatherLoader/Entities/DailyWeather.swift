//
//  DailyWeather.swift
//  
//
//  Created by Евгений Кириллов on 21.08.2021.
//

import Foundation

/// Weather parameters in specific day
public struct DailyWeather: Decodable {
    
    /// Time of data forecasted
    public let dt: Int
    
    /// Time of sunrise
    public let sunrise: Int
    
    /// Time of sunset
    public let sunset: Int
    
    /// Temperature during the day
    public let temp: Temperature
    
    /// Human perception of weather
    public let feelsLike: Temperature
    
    /// Atmospheric pressure on the sea level, hPa
    public let pressure: Int
    
    /// Humidity, %
    public let humidity: Int
    
    /// Description of weather
    public let weather: [Conditions]
    
    /// Wind speed
    ///
    /// Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour
    public let speed: Double
    
    /// Wind direction, degrees (meteorological)
    public let deg: Int
    
    /// Wind gust
    ///
    /// Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour.
    public let gust: Double
    
    /// Cloudiness, %
    public let clouds: Int
    
    /// Probability of precipitation
    public let pop: Double
    
    /// Precipitation volume, mm
    public let rain: Double?
    
    /// Snow volume, mm
    public let snow: Double?
}
