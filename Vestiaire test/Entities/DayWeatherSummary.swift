//
//  DayWeatherSummary.swift
//  Vestiaire test
//
//  Created by Евгений Кириллов on 22.08.2021.
//

/// Short summary of weather at specific day with details underneath it
struct DayWeatherSummary {
    
    /// Name of image that represents weather conditions
    let conditionsIconName: String
    
    /// Maximum temperature at specific day
    let maxTemperature: Double
    
    /// Minimum temperature at specific day
    let minTemperature: Double
    
    /// Day of the weak with this weather info
    let weakday: String
    
    /// Date representation
    let date: String
    
    /// More details about weather
    let details: DayWeatherDetails
}

extension DayWeatherSummary: RandomEntityGenerator {
    static var random: DayWeatherSummary {
        .init(
            conditionsIconName: ["01d", "09n", "50d"].randomElement()!,
            maxTemperature: .random(in: 0...40),
            minTemperature: .random(in: -40...0),
            weakday: "Saturday",
            date: "25 july 2021",
            details: .random
        )
    }
}
