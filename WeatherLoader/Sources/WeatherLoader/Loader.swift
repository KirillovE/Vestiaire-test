//
//  Loader.swift
//
//
//  Created by Евгений Кириллов on 21.08.2021.
//

import Foundation

/// An object that handles requests to OpenWeather API
public struct Loader {
    
    /// Response of forecast network request
    public typealias ForecastResponse = (Result<WeatherFields, WeatherError>) -> ()
    
    /// Identifier associated with your application
    public let appID: String
    
    /// Data format
    public let mode: Mode
    
    /// Units of measurement
    public let units: Units
    
    private let endpoint = "https://api.openweathermap.org/data/2.5/forecast/daily"
    private let session = URLSession.shared
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
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
    
}

// MARK: - Data transfer

extension Loader {
    
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
        
        formTask(url, completion).resume()
    }
    
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
    
    func formTask(_ url: URL, _ completion: @escaping ForecastResponse) -> URLSessionDataTask {
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                let responseError = WeatherError(stringLiteral: error.localizedDescription)
                completion(.failure(responseError))
                return
            }
            
            guard
                let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode)
            else {
                let serverError = WeatherError(description: response.debugDescription)
                completion(.failure(serverError))
                return
            }
            
            guard
                let mimeType = httpResponse.mimeType,
                mimeType == "application/json",
                let data = data
            else {
                completion(.failure("Invalid response format"))
                return
            }
            
            do {
                let weather = try decoder.decode(WeatherFields.self, from: data)
                completion(.success(weather))
            } catch let decodingError {
                let decodingErrorText = WeatherError(description: decodingError.localizedDescription)
                completion(.failure(decodingErrorText))
            }
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
