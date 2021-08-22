//
//  DayWeatherDetails.swift
//  Vestiaire test
//
//  Created by Евгений Кириллов on 22.08.2021.
//

/// Detailed info of weather at specific day
struct DayWeatherDetails {
    let date: String
    let sunriseTime: String
    let sunsetTime: String
    
    let humidity: Int
    let precipitationProbability: Int
    let windSpeed: Int
    let cloudiness: Int
    
    let conditionIconName: String
    let conditionDescription: String
    
    let temperature: Temperature
    let feelsLike: Temperature
}

extension DayWeatherDetails: RandomEntityGenerator {
    static var random: DayWeatherDetails {
        .init(
            date: "31 august 2021",
            sunriseTime: "9:35",
            sunsetTime: "20:34",
            humidity: .random(in: 0...100),
            precipitationProbability: .random(in: 0...100),
            windSpeed: .random(in: 0...33),
            cloudiness: .random(in: 0...100),
            conditionIconName: "10d",
            conditionDescription: "raining",
            temperature: .random,
            feelsLike: .random
        )
    }
}
