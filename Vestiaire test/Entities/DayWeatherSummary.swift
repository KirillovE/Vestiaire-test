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
    
    /// Information to represent specific day
    let dateInfo: Int
    
    /// More details about weather
    let details: DayWeatherDetails
}

extension DayWeatherSummary: RandomEntityGenerator {
    static var random: DayWeatherSummary {
        .init(
            conditionsIconName: "",
            maxTemperature: .random(in: 0...40),
            minTemperature: .random(in: -40...0),
            dateInfo: .random(in: 0...1_929_658_434),
            details: .random
        )
    }
}
