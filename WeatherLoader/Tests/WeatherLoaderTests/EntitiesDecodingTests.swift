import XCTest
@testable import WeatherLoader

final class EntitiesDecodingTests: XCTestCase {
    
    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func getDecodedResponse<T: Decodable>(ofType type: T.Type, from input: APIResponses) -> T? {
        try? decoder.decode(type.self, from: input.data!)
    }
    
    func testWeatherFields() {
        let response = getDecodedResponse(ofType: WeatherFields.self, from: .full)!
        
        XCTAssertEqual(response.cnt, 16)
        XCTAssertEqual(response.list.count, 1)
    }
    
    func testCity() {
        let response = getDecodedResponse(ofType: City.self, from: .city)!
        
        XCTAssertEqual(response.name, "Paris")
        XCTAssertEqual(response.country, "FR")
        XCTAssertEqual(response.timezone, 7200)
        XCTAssertEqual(response.id, 2988507)
    }
    
    func testConditions() {
        let response = getDecodedResponse(ofType: Conditions.self, from: .conditions)!
        
        XCTAssertEqual(response.main, "Clear")
        XCTAssertEqual(response.description, "sky is clear")
        XCTAssertEqual(response.icon, "01d")
        XCTAssertEqual(response.id, 800)
    }
    
    func testDailyWeather() {
        let response = getDecodedResponse(ofType: DailyWeather.self, from: .dailyWeather)!
        
        XCTAssertEqual(response.dt, 1630580400)
        XCTAssertEqual(response.sunrise, 1630559342)
        XCTAssertEqual(response.sunset, 1630607517)
        XCTAssertEqual(response.pressure, 1016)
        XCTAssertEqual(response.humidity, 28)
        XCTAssertEqual(response.speed, 4.67)
        XCTAssertEqual(response.deg, 241)
        XCTAssertEqual(response.gust, 7.37)
        XCTAssertEqual(response.clouds, 0)
        XCTAssertEqual(response.pop, 0)
    }
    
    func testGeolocation() {
        let response = getDecodedResponse(ofType: GeoLocation.self, from: .geolocation)!
        
        XCTAssertEqual(response.lat, 48.8534)
        XCTAssertEqual(response.lon, 2.3488)
    }
    
    func testTemeperature() {
        let response = getDecodedResponse(ofType: Temperature.self, from: .temperature)!
        
        XCTAssertEqual(response.min, 18.3)
        XCTAssertEqual(response.max, 31.21)
        XCTAssertEqual(response.day, 29.36)
        XCTAssertEqual(response.morn, 18.3)
        XCTAssertEqual(response.eve, 28.26)
        XCTAssertEqual(response.night, 23.89)
    }
}
