import XCTest
@testable import WeatherLoader

final class NetworkingTests: XCTestCase {
    
    private var loader: Loader?
    
    override func setUp() {
        loader = Loader(
            appID: "vestiaire",
            mode: .json,
            units: .metric
        )
    }
    
    func testFormURL() {
        let url = loader?.formURL(1, "Paris")
        XCTAssertNotNil(url)
        XCTAssertEqual(url!.scheme, "https")
        XCTAssertEqual(url!.host, "api.openweathermap.org")
        XCTAssertEqual(url!.path, "/data/2.5/forecast/daily")
        
        let queryParameters = getQueryParameters(of: url!)
        XCTAssertEqual(queryParameters["q"], "Paris")
        XCTAssertEqual(queryParameters["cnt"], "1")
        XCTAssertEqual(queryParameters["mode"], "json")
        XCTAssertEqual(queryParameters["units"], "metric")
        XCTAssertEqual(queryParameters["appid"], "vestiaire")
    }
    
    func testCountNormalizationGreater() {
        let url = loader?.formURL(100, "Paris")
        let queryParameters = getQueryParameters(of: url!)
        
        XCTAssertEqual(queryParameters["cnt"], "16")
    }
    
    func testCountNormalizationLess() {
        let url = loader?.formURL(-7, "Paris")
        let queryParameters = getQueryParameters(of: url!)
        
        XCTAssertEqual(queryParameters["cnt"], "1")
    }
    
    func testDataDecoding() {
        let result = loader?.decodeLoadedData(APIResponses.full.data!)
        XCTAssertNoThrow(try result?.get())
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
