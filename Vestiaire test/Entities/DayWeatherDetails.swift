//
//  DayWeatherDetails.swift
//  Vestiaire test
//
//  Created by Евгений Кириллов on 22.08.2021.
//

/// Detailed info of weather at specific day
struct DayWeatherDetails {
    
    // Overview section data
    let conditionIconName: String
    let conditionDescription: String
    let date: String
    let sunriseTime: String
    let sunsetTime: String
    
    // Conditions section data
    let humidity: Int
    let precipitationProbability: Int
    let windSpeed: Int
    let cloudiness: Int
    
    // Temperature section data
    let temperature: Temperature
    
    // Feels like section data
    let feelsLike: Temperature
    
}

// MARK: - RandomEntityGenerator

extension DayWeatherDetails: RandomEntityGenerator {
    
    static var random: DayWeatherDetails {
        .init(
            conditionIconName: "10d",
            conditionDescription: "raining",
            date: "31 august 2021",
            sunriseTime: "9:35",
            sunsetTime: "20:34",
            humidity: .random(in: 0...33),
            precipitationProbability: .random(in: 0...100),
            windSpeed: .random(in: 0...100),
            cloudiness: .random(in: 0...100),
            temperature: .random,
            feelsLike: .random
        )
    }

}
