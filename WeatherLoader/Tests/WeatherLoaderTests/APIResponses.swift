//
//  APIResponses.swift
//  
//
//  Created by Евгений Кириллов on 21.08.2021.
//

import Foundation

/// Responses to test data decoding
enum APIResponses {
    case city, conditions, dailyWeather, geolocation, temperature, full
    
    /// Response stub
    var data: Data? {
        let str: String
        switch self {
        case .city:
            str = cityResponse
        case .conditions:
            str = conditionsResponse
        case .dailyWeather:
            str = dailyWeatherResponse
        case .geolocation:
            str = geolocationResponse
        case .temperature:
            str = temperatureResponse
        case .full:
            str = fullResponse
        }
        return str.data(using: .utf8)
    }
    
    private var cityResponse: String {
        """
        {
            "id": 2988507,
            "name": "Paris",
            "coord": {
                "lon": 2.3488,
                "lat": 48.8534
            },
            "country": "FR",
            "population": 2138551,
            "timezone": 7200
        }
        """
    }
    
    private var conditionsResponse: String {
        """
        {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
        }
        """
    }
    
    private var dailyWeatherResponse: String {
        """
        {
            "dt": 1630580400,
            "sunrise": 1630559342,
            "sunset": 1630607517,
            "temp": {
                "day": 29.36,
                "min": 18.3,
                "max": 31.21,
                "night": 23.89,
                "eve": 28.26,
                "morn": 18.3
            },
            "feels_like": {
                "day": 28.06,
                "night": 23.33,
                "eve": 27.15,
                "morn": 17.33
            },
            "pressure": 1016,
            "humidity": 28,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "sky is clear",
                    "icon": "01d"
                }
            ],
            "speed": 4.67,
            "deg": 241,
            "gust": 7.37,
            "clouds": 0,
            "pop": 0
        }
        """
    }
    
    private var geolocationResponse: String {
        """
        {
            "lon": 2.3488,
            "lat": 48.8534
        }
        """
    }
    
    private var temperatureResponse: String {
        """
        {
            "day": 29.36,
            "min": 18.3,
            "max": 31.21,
            "night": 23.89,
            "eve": 28.26,
            "morn": 18.3
        }
        """
    }
    
    private var fullResponse: String {
        """
        {
            "city": {
                "id": 2988507,
                "name": "Paris",
                "coord": {
                    "lon": 2.3488,
                    "lat": 48.8534
                },
                "country": "FR",
                "population": 2138551,
                "timezone": 7200
            },
            "cod": "200",
            "message": 0.0731551,
            "cnt": 16,
            "list": [
                {
                    "dt": 1630580400,
                    "sunrise": 1630559342,
                    "sunset": 1630607517,
                    "temp": {
                        "day": 29.36,
                        "min": 18.3,
                        "max": 31.21,
                        "night": 23.89,
                        "eve": 28.26,
                        "morn": 18.3
                    },
                    "feels_like": {
                        "day": 28.06,
                        "night": 23.33,
                        "eve": 27.15,
                        "morn": 17.33
                    },
                    "pressure": 1016,
                    "humidity": 28,
                    "weather": [
                        {
                            "id": 800,
                            "main": "Clear",
                            "description": "sky is clear",
                            "icon": "01d"
                        }
                    ],
                    "speed": 4.67,
                    "deg": 241,
                    "gust": 7.37,
                    "clouds": 0,
                    "pop": 0
                }
            ]
        }
        """
    }
}
