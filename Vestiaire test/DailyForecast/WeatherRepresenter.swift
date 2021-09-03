//
//  WeatherRepresenter.swift
//  Vestiaire test
//
//  Created by Евгений Кириллов on 23.08.2021.
//

/// A type that able to represent weather data somehow
protocol WeatherRepresenter: AnyObject {
    
    /// Show weather data to user
    /// - Parameter weather: Weather data to be shown
    func showWeather(_ weather: GeneralDailyWeather)
    
}
