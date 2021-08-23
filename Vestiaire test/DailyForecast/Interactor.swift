//
//  Interactor.swift
//  Vestiaire test
//
//  Created by Евгений Кириллов on 22.08.2021.
//

import Foundation
import WeatherLoader

struct Interactor {
    
    private let loader: Loader
    private let translator = EntityTranslator()
    private let weatherRepresenter: WeatherRepresenter
    
    init(weatherRepresenter: WeatherRepresenter) {
        guard
            let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
            let info = NSDictionary(contentsOfFile: path) as? [String: AnyObject],
            let apiKey = info["APIkey"] as? String
        else {
            preconditionFailure("Unable to read API key from Info.plist")
        }
        
        self.loader = Loader(appID: apiKey, mode: .json, units: .metric)
        self.weatherRepresenter = weatherRepresenter
    }
    
    func loadWeather() {
        loader.loadDailyForecast(for: "Paris", in: 16) { loadedResult in
            switch loadedResult {
            case .success(let forecast):
                let presentableForecast = translator.getGeneralWeather(from: forecast)
                weatherRepresenter.showWeather(presentableForecast)
            case .failure(let error):
                print(error)
            }
        }
    }
}
