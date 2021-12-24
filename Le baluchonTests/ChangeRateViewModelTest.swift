//
//  ChangeRateViewModelTest.swift
//  Le baluchonTests
//
//  Created by Valc0d3 on 22/12/2021.
//

import XCTest
@testable import Le_baluchon

final class ChangeRateViewModelTest: XCTestCase {

    func testWhenDidpressChangeRateWithSuccessThenOutputsAreCorrectlyReturned() {
        let displayedResultExpectation = self.expectation(description: "Returned result text")
        
        let mock = MockChangeRateRepository(responses: .success)
        let viewModel = ChangeRateViewModel(repository: mock)
        
        var counter = 0
        
        viewModel.displayedResult = { text in
            if counter == 1 {
                XCTAssertEqual(text, "1.3569516")
                displayedResultExpectation.fulfill()
            }
            counter+=1
        }
        viewModel.viewDidLoad()
        viewModel.didPressChangeRate(for: "1.2")
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testWhenDidpressChangeRateWithFailureThenOutputsAreCorrectlyReturned() {
        let displayedResultExpectation = self.expectation(description: "Returned result text")
        
        let mock = MockChangeRateRepository(responses: .failure)
        let viewModel = ChangeRateViewModel(repository: mock)
        
        var counter = 0
        
        viewModel.displayedResult = { text in
            if counter == 1 {
                XCTAssertEqual(text, "Erreur: Une erreur est survenue")
                displayedResultExpectation.fulfill()
            }
            counter+=1
        }
        viewModel.viewDidLoad()
        viewModel.didPressChangeRate(for: "1.2")
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}

private struct MockChangeRateRepository: ChangeRateRepositoryType {
    let responses: Responses

    init(responses: Responses) {
        self.responses = responses
    }
    struct Responses {
        var ongetChangeRate: Result<ChangeRateResponse, Error>
    }
    
    func gateRate(callBack: @escaping (Result<ChangeRateResponse, Error>) -> Void) {
        callBack(responses.ongetChangeRate)
    }
}

private extension MockChangeRateRepository.Responses {
    static var success: MockChangeRateRepository.Responses {
        return .init(
            ongetChangeRate: .success(ChangeRateResponse(
                success: true,
                timestamp: 1640176466,
                base: "EUR",
                date: "2021-12-22",
                rates: ChangeRateResponse.Rates.init(usd: 1.130793)
            ))
        )
    }
    
    static var failure: MockChangeRateRepository.Responses {
        return .init(
            ongetChangeRate: .failure(MockError.mock)
        )
    }
    
    enum MockError: Error {
        case mock
    }
}

