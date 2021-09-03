//
//  Loader.swift
//
//
//  Created by Евгений Кириллов on 21.08.2021.
//

import Foundation

/// An object that handles requests to OpenWeather API
public struct Loader {
    
    // MARK: Public properties
    
    /// Response of forecast network request
    public typealias ForecastResponse = (Result<WeatherFields, TextualError>) -> ()
    
    /// Identifier associated with your application
    public let appID: String
    
    /// Data format
    public let mode: Mode
    
    /// Units of measurement
    public let units: Units
    
    // MARK: Private properties
    
    private let endpoint = "https://api.openweathermap.org/data/2.5/forecast/daily"
    private let networking = Networking()
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    // MARK: Public methods
    
    /// Generate a new instanse explicitly setting properties
    /// - Parameters:
    ///   - appID: Identifier associated with your application
    ///   - mode: Data format
    ///   - units: Units of measurement
    public init(appID: String, mode: Loader.Mode, units: Loader.Units) {
        self.appID = appID
        self.mode = mode
        self.units = units
    }
    
    /// Load daily forecast from the server
    ///
    /// You can search 16 day weather forecast with daily average parameters by city name
    /// - Parameters:
    ///   - city: City name
    ///   - days: A number of days, which will be returned in the API response (from 1 to 16)
    ///   - completion: Closure containing loaded forecast or error
    public func loadDailyForecast(
        for city: String,
        in days: Int,
        completion: @escaping ForecastResponse
    ) {
        guard let url = formURL(days, city) else {
            completion(.failure("Failed to form request"))
            return
        }
        
        let task = networking.loadDataFromURL(url) { result in
            let forecastResult = result.flatMap(decodeLoadedData)
            completion(forecastResult)
        }
        
        task.resume()
    }
    
}

// MARK: - Helper methods

extension Loader {
    
    func formURL(_ days: Int, _ city: String) -> URL? {
        let normalizationRange = 1...16
        let normalizedCount = max(min(days, normalizationRange.upperBound), normalizationRange.lowerBound)
        
        var components = URLComponents(string: endpoint)
        let queryItems: [URLQueryItem] = [
            .init(name: "q", value: city),
            .init(name: "cnt", value: String(normalizedCount)),
            .init(name: "mode", value: mode.rawValue),
            .init(name: "units", value: units.rawValue),
            .init(name: "appid", value: appID)
        ]
        components?.queryItems = queryItems
        
        return components?.url
    }
    
    func decodeLoadedData(_ data: Data) -> Result<WeatherFields, TextualError> {
        do {
            let weather = try decoder.decode(WeatherFields.self, from: data)
            return .success(weather)
        } catch let decodingError {
            let decodingErrorText = TextualError(description: decodingError.localizedDescription)
            return .failure(decodingErrorText)
        }
    }
    
}

// MARK: - Auxiliary types

public extension Loader {
    
    /// Data format
    ///
    /// If the parameter is empty the format is `JSON` by default
    enum Mode: String {
        case json, xml
    }
    
    /// Units of measurement
    ///
    /// If you do not use the parameter, `standard` units will be applied by default
    enum Units: String {
        case standard, metric, imperial
    }
}
