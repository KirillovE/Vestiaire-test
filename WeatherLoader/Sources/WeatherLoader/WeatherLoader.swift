import Foundation

/// An object that handles requests to OpenWeather API
struct WeatherLoader {
    
    /// Response of forecast network request
    typealias ForecastResponse = (Result<WeatherFields, TextualError>) -> ()
    
    /// Identifier associated with your application
    let appID: String
    
    /// Data format
    let mode: Mode
    
    /// Units of measurement
    let units: Units
}

// MARK: - Data transfer
extension WeatherLoader {
    
    /// Load daily forecast from the server
    ///
    /// You can search 16 day weather forecast with daily average parameters by city name
    /// - Parameters:
    ///   - city: City name
    ///   - days: A number of days, which will be returned in the API response (from 1 to 16)
    ///   - completion: Closure containing loaded forecast or error
    func loadDailyForecast(
        for city: String,
        in days: Int,
        completion: @escaping ForecastResponse
    ) {
        let normalizationRange = 1...16
        let normalizedCount = max(min(days, normalizationRange.upperBound), normalizationRange.lowerBound)
    }
    
}

// MARK: - Auxiliary types
extension WeatherLoader {
    
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
