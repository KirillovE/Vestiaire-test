//
//  GeneralDailyWeather.swift
//  Vestiaire test
//
//  Created by Евгений Кириллов on 22.08.2021.
//

/// Day-by-day weather info
struct GeneralDailyWeather {
    
    /// City in which weather is observed
    let cityName: String
    
    /// Country of specified city
    let countryName: String
    
    /// Summary data to represent each day
    let daySummaries: [DayWeatherSummary]
}

extension GeneralDailyWeather: RandomEntityGenerator {
    static var random: GeneralDailyWeather {
        .init(
            cityName: "Tatooine",
            countryName: "Republic",
            daySummaries: (1...16).map({ _ in DayWeatherSummary.random })
        )
    }
}
