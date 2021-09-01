//
//  Vestiaire_test_UnitTests.swift
//  Vestiaire test UnitTests
//
//  Created by Евгений Кириллов on 01.09.2021.
//

import XCTest
@testable import Vestiaire_test

class Vestiaire_test_UnitTests: XCTestCase {

    func testHotWeather() {
        let randomHotTemperature = Int.random(in: 26...100)
        let hotTemperature = Temperature.mockWithDayTemperature(randomHotTemperature)
        let details = DayWeatherDetails.mockWithTemperature(hotTemperature)
        
        XCTAssertEqual(details.conditionReachDescription, "Hot, \(details.conditionDescription)")
    }
    
    func testColdWeather() {
        let randomColdTemperature = Int.random(in: -100..<10)
        let coldTemperature = Temperature.mockWithDayTemperature(randomColdTemperature)
        let details = DayWeatherDetails.mockWithTemperature(coldTemperature)
        
        XCTAssertEqual(details.conditionReachDescription, "Cold, \(details.conditionDescription)")
    }
    
    func testRegularWeather() {
        let randomRegularTemperature = Int.random(in: 10..<26)
        let regularTemperature = Temperature.mockWithDayTemperature(randomRegularTemperature)
        let details = DayWeatherDetails.mockWithTemperature(regularTemperature)
        
        XCTAssertEqual(details.conditionReachDescription, details.conditionDescription)
    }
    
}

private extension Temperature {
    
    static func mockWithDayTemperature(_ temp: Int) -> Temperature {
        .init(
            morning: .random(in: -40...40),
            day: temp,
            evening: .random(in: -40...40),
            night: .random(in: -40...40)
        )
    }
    
}

private extension DayWeatherDetails {
    
    static func mockWithTemperature(_ temp: Temperature) -> DayWeatherDetails {
        .init(
            conditionIconName: "",
            conditionDescription: "mocked condition",
            date: "",
            sunriseTime: "",
            sunsetTime: "",
            humidity: .random(in: 0...100),
            precipitationProbability: .random(in: 0...100),
            windSpeed: .random(in: 0...100),
            cloudiness: .random(in: 0...100),
            temperature: temp,
            feelsLike: .random
        )
    }
    
}
