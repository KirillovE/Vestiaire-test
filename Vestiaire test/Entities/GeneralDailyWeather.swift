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
    
    /// Number of days in this forecast
    let daysCount: Int
    
    /// Summary data to represent each day
    let daySummaries: [DayWeatherSummary]
}

extension GeneralDailyWeather: RandomEntityGenerator {
    static var random: GeneralDailyWeather {
        let daysCount = Int.random(in: 1...16)
        return .init(
            cityName: "Tatooine",
            countryName: "Republic",
            daysCount: daysCount,
            daySummaries: (1...daysCount).map({ _ in DayWeatherSummary.random })
        )
    }
}
