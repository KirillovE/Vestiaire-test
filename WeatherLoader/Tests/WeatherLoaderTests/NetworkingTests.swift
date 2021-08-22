import XCTest
@testable import WeatherLoader

final class NetworkingTests: XCTestCase {
    
    func testFormURL() {
        let loader = WeatherLoader(
            appID: "vestiaire",
            mode: .json,
            units: .metric
        )
        let url = loader.formURL(1, "Paris")
        XCTAssertNotNil(url)
        
        let queryParameters = getQueryParameters(of: url!)
        XCTAssertEqual(queryParameters["q"], "Paris")
        XCTAssertEqual(queryParameters["cnt"], "1")
        XCTAssertEqual(queryParameters["mode"], "json")
        XCTAssertEqual(queryParameters["units"], "metric")
        XCTAssertEqual(queryParameters["appid"], "vestiaire")
    }
    
    func testCountNormalizationGreater() {
        let loader = WeatherLoader(
            appID: "vestiaire",
            mode: .json,
            units: .metric
        )
        let url = loader.formURL(100, "Paris")
        let queryParameters = getQueryParameters(of: url!)
        
        XCTAssertEqual(queryParameters["cnt"], "16")
    }
    
    func testCountNormalizationLess() {
        let loader = WeatherLoader(
            appID: "vestiaire",
            mode: .json,
            units: .metric
        )
        let url = loader.formURL(-7, "Paris")
        let queryParameters = getQueryParameters(of: url!)
        
        XCTAssertEqual(queryParameters["cnt"], "1")
    }
    
}

extension NetworkingTests {
    func getQueryParameters(of url: URL) -> [String: String] {
        url.query!
            .split(separator: "&")
            .reduce(into: [:]) { dict, item in
                let keyValuePair = item.split(separator: "=").map(String.init)
                dict[keyValuePair[0]] = keyValuePair[1]
            }
    }
}
