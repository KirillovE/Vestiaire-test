//
//  WeatherDetailsRepresenter.swift
//  Vestiaire test
//
//  Created by Евгений Кириллов on 03.09.2021.
//

/// A type that able to represent weather details data somehow
protocol WeatherDetailsRepresenter: AnyObject {
    
    /// Show weather details to user
    /// - Parameter weatherDetails: Details to be shown
    func showDetails(_ weatherDetails: DayWeatherDetails)
}
