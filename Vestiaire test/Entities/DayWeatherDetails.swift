//
//  DayWeatherDetails.swift
//  Vestiaire test
//
//  Created by Евгений Кириллов on 22.08.2021.
//

/// Detailed info of weather at specific day
struct DayWeatherDetails {
    
}

extension DayWeatherDetails: RandomEntityGenerator {
    static var random: DayWeatherDetails {
        .init()
    }
}
