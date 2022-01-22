//
//  WeatherViewModelTests.swift
//  Le baluchonTests
//
//  Created by Valc0d3 on 20/12/2021.
//

import XCTest
@testable import Le_baluchon

final class WeatherViewModelTests: XCTestCase {
    
    func testWhenViewDidLoadThenOutputsAreCorrectlyReturned() {
        let nameText1Expectation = self.expectation(description: "Returned name text 1")
        let tempText1Expectation = self.expectation(description: "Returned temp text 1")
        tempText1Expectation.expectedFulfillmentCount = 2
        let humidityText1Expectation = self.expectation(description: "Returned humidity text 1")
        humidityText1Expectation.expectedFulfillmentCount = 2
        let descriptionText1Expectation = self.expectation(description: "Returned description text 2")
        descriptionText1Expectation.expectedFulfillmentCount = 2
        
        let nameText2Expectation = self.expectation(description: "Returned name text 2")
        nameText2Expectation.expectedFulfillmentCount = 2
        let tempText2Expectation = self.expectation(description: "Returned temp text 2")
        tempText2Expectation.expectedFulfillmentCount = 2
        let humidityText2Expectation = self.expectation(description: "Returned humidity text 2")
        humidityText2Expectation.expectedFulfillmentCount = 2
        let descriptionText2Expectation = self.expectation(description: "Returned description text 2")
        descriptionText2Expectation.expectedFulfillmentCount = 2
        
        let mock = MockWeatherRepository(responses: .success)
        let viewModel = WeatherViewModel(repository: mock)
        
        var counter = 0
        viewModel.nameText1 = { text in
            if counter == 1 {
                XCTAssertEqual(text, "toto")
                nameText1Expectation.fulfill()
            }
            counter+=1
        }
        
        viewModel.tempText1 = { _ in
            tempText1Expectation.fulfill()
        }
        viewModel.humidityText1 = { _ in
            humidityText1Expectation.fulfill()
        }
        
        viewModel.descriptionText1 = { _ in
            descriptionText1Expectation.fulfill()
        }
        
        viewModel.nameText2 = { _ in
            nameText2Expectation.fulfill()
        }
        
        viewModel.tempText2 = { _ in
            tempText2Expectation.fulfill()
        }
        viewModel.humidityText2 = { _ in
            humidityText2Expectation.fulfill()
        }
        
        viewModel.descriptionText2 = { _ in
            descriptionText2Expectation.fulfill()
        }
        
        viewModel.viewDidLoad()
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testWhenDidpressTranslateWithFailureThenOutputsAreCorrectlyReturned() {
        let expectation = self.expectation(description: "Returned Alert")
        let mock = MockWeatherRepository(responses: .failure)
        let viewModel = WeatherViewModel(repository: mock)
        
        var counter = 0
        
        viewModel.displayedAlert = { alert in
            if counter == 0 {
            XCTAssertEqual(alert.title, "Alert")
               XCTAssertEqual(alert.message, "Une erreur est survenue, veuillez réessayer plus tard.")
               XCTAssertEqual(alert.cancelTitle, "Ok")
               expectation.fulfill()
            }
            print("yolo",counter)
            counter+=1
        }
        
        viewModel.viewDidLoad()
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}

private struct MockWeatherRepository: WeatherRepositoryType {
    
    let responses: Responses
    
    init(responses: Responses) {
        self.responses = responses
    }
    
    struct Responses {
        var ongetWeather: Result<WeatherResponse, Error>
    }
    
    func getWeatherInfo(for city: String, callBack: @escaping (Result<WeatherResponse, Error>) -> Void) {
        callBack(responses.ongetWeather)
    }
}

private extension MockWeatherRepository.Responses {
    static var success: MockWeatherRepository.Responses {
        return .init(
            ongetWeather: .success(WeatherResponse(
                coord: .init(lon: 2.0, lat: 2.0),
                weather: [.init(id: 1, main: "test", weatherDescription: "test", icon: "test")],
                base: "toto",
                main: .init(
                    temp: 2.0,
                    feelsLike: 2.0,
                    tempMin: 1,
                    tempMax: 1,
                    pressure: 1,
                    humidity: 1
                ),
                visibility: 1,
                wind: .init(speed: 2.0, deg: 1, gust: 2.0),
                clouds: .init(all: 1),
                dt: 1,
                sys: .init(type: 1, id: 1, country: "toto", sunrise: 1, sunset: 1),
                timezone: 1,
                id: 1,
                name: "toto",
                cod: 1
            ))
        )
    }
    
    static var failure: MockWeatherRepository.Responses {
        return .init(
            ongetWeather: .failure(MockError.mock)
        )
    }
    
    enum MockError: Error {
        case mock
    }
}
