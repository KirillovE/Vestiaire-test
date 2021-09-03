//
//  Interactor.swift
//  Vestiaire test
//
//  Created by Евгений Кириллов on 22.08.2021.
//

import Foundation
import WeatherLoader

/// Object that interacts with different services
struct Interactor {
    
    private let loader: Loader
    private let translator = EntityTranslator()
    private weak var weatherRepresenter: WeatherRepresenter?
    private weak var errorRepresenter: ErrorRepresenter?
    
    /// Initialize object
    /// - Parameters:
    ///   - weatherRepresenter: Object that able to represent weather data
    ///   - errorRepresenter: Object that able to represent error data
    init(
        weatherRepresenter: WeatherRepresenter,
        errorRepresenter: ErrorRepresenter
    ) {
        guard
            let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
            let info = NSDictionary(contentsOfFile: path) as? [String: AnyObject],
            let apiKey = info["APIkey"] as? String
        else {
            preconditionFailure("Unable to read API key from Info.plist")
        }
        
        self.loader = Loader(appID: apiKey, mode: .json, units: .metric)
        self.weatherRepresenter = weatherRepresenter
        self.errorRepresenter = errorRepresenter
    }
    
    /// Load weather data from some storage
    func loadWeather() {
        loader.loadDailyForecast(for: "Paris", in: 16) { loadedResult in
            switch loadedResult {
            case .success(let forecast):
                let presentableForecast = translator.getGeneralWeather(from: forecast)
                weatherRepresenter?.showWeather(presentableForecast)
            case .failure(let error):
                let errorText = String(describing: error)
                errorRepresenter?.showError(errorText)
            }
        }
    }
    
}
