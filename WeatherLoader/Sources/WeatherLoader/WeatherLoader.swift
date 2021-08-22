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
    
    private let endpoint = "https://api.openweathermap.org/data/2.5/forecast/daily"
    private let session = URLSession.shared
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
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
        guard let url = formURL(days, city) else {
            let errorFormingRequest: TextualError = "Failed to form request"
            completion(.failure(errorFormingRequest))
            return
        }
        
        formTask(url, completion).resume()
    }
    
    private func formURL(_ days: Int, _ city: String) -> URL? {
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
    
    private func formTask(_ url: URL, _ completion: @escaping ForecastResponse) -> URLSessionDataTask {
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                let responseError = TextualError(stringLiteral: error.localizedDescription)
                completion(.failure(responseError))
                return
            }
            
            guard
                let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode)
            else {
                let serverError = TextualError(description: response.debugDescription)
                completion(.failure(serverError))
                return
            }
            
            guard
                let mimeType = httpResponse.mimeType,
                mimeType == "application/json",
                let data = data
            else {
                let responseError: TextualError = "Invalid response format"
                completion(.failure(responseError))
                return
            }
            
            do {
                let weather = try decoder.decode(WeatherFields.self, from: data)
                completion(.success(weather))
            } catch let decodingError {
                let decodingErrorText = TextualError(description: decodingError.localizedDescription)
                completion(.failure(decodingErrorText))
            }
        }
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
