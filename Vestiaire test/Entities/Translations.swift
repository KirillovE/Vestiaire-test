//
//  Translations.swift
//  Vestiaire test
//
//  Created by Евгений Кириллов on 22.08.2021.
//

import Foundation
import WeatherLoader

struct Translations {
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    private let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }()
    
    private let weekDayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter
    }()
    
    func getGeneralWeather(from apiWeather: WeatherFields) -> GeneralDailyWeather {
        .init(
            cityName: apiWeather.city.name,
            countryName: apiWeather.city.country,
            daySummaries: getWeatherSummary(from: apiWeather.list)
        )
    }
    
    private func getWeatherSummary(from dailyWeather: [DailyWeather]) -> [DayWeatherSummary] {
        dailyWeather.map { weather in
            let date = Date(timeIntervalSince1970: TimeInterval(weather.dt))
            return DayWeatherSummary(
                conditionsIconName: weather.weather.first?.icon ?? "",
                maxTemperature: Int(weather.temp.max ?? 0),
                minTemperature: Int(weather.temp.min ?? 0),
                weakday: weekDayFormatter.string(from: date),
                date: dateFormatter.string(from: date),
                details: getWeatherDetails(weather: weather)
            )
        }
    }
    
    private func getWeatherDetails(weather: DailyWeather) -> DayWeatherDetails {
        let date = Date(timeIntervalSince1970: TimeInterval(weather.dt))
        let sunriseDate = Date(timeIntervalSince1970: TimeInterval(weather.sunrise))
        let sunsetDate = Date(timeIntervalSince1970: TimeInterval(weather.sunset))
        return .init(
            date: dateFormatter.string(from: date),
            sunriseTime: timeFormatter.string(from: sunriseDate),
            sunsetTime: timeFormatter.string(from: sunsetDate),
            humidity: weather.humidity,
            precipitationProbability: Int(weather.pop),
            windSpeed: Int(weather.speed),
            cloudiness: weather.clouds,
            conditionIconName: weather.weather.first?.icon ?? "",
            conditionDescription: weather.weather.first?.description ?? "",
            temperature: getTemperature(from: weather.temp),
            feelsLike: getTemperature(from: weather.feelsLike)
        )
    }
    
    private func getTemperature(from apiTemperature: WeatherLoader.Temperature) -> Temperature {
        .init(
            morning: Int(apiTemperature.morn),
            day: Int(apiTemperature.day),
            evening: Int(apiTemperature.eve),
            night: Int(apiTemperature.night)
        )
    }
}
