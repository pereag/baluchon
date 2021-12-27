//
//  TranslateViewModelTest.swift
//  Le baluchonTests
//
//  Created by Valc0d3 on 22/12/2021.
//

import XCTest
@testable import Le_baluchon

final class TranslateViewModelTest: XCTestCase {
    
    func testWhenDidpressTranslateWithSuccessThenOutputsAreCorrectlyReturned() {
        let translatedTextExpectation = self.expectation(description: "Returned name translated Text")
        let mock = MockTranslateRepository(responses: .success)
        let viewModel = TranslateViewModel(repository: mock)
        
        var counter = 0
        
        viewModel.translatedText = { text in
            if counter == 1 {
                XCTAssertEqual(text, "My name is Valentin")
                translatedTextExpectation.fulfill()
            }
            counter+=1
        }
        
        viewModel.viewDidLoad()
        
        viewModel.didPress(translate: "Je m'appel Valentin")
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testWhenDidpressTranslateWithFailureThenOutputsAreCorrectlyReturned() {
        let translatedTextExpectation = self.expectation(description: "Returned name translated Text")
        let mock = MockTranslateRepository(responses: .failure)
        let viewModel = TranslateViewModel(repository: mock)
        
        var counter = 0
        
        viewModel.translatedText = { text in
            if counter == 1 {
                XCTAssertEqual(text, "Erreur: Une erreur de communication avec l'API est survenue")
                translatedTextExpectation.fulfill()
            }
            counter+=1
        }
        
        viewModel.viewDidLoad()
        
        viewModel.didPress(translate: "Je m'appel Valentin")
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}

private struct MockTranslateRepository: TranslateRepositoryType {
    let responses: Responses
    
    init(responses: Responses) {
        self.responses = responses
    }
    
    struct Responses {
        var ongetTranslate: Result<TranslateResponse, Error>
    }
    func getTranslation(for phrase: String, callBack: @escaping (Result<TranslateResponse, Error>) -> Void) {
        callBack(responses.ongetTranslate)
    }
}

private extension MockTranslateRepository.Responses {
    static var success: MockTranslateRepository.Responses {
        return .init(
            ongetTranslate: .success(TranslateResponse(
                data: TranslateResponse.DataClass.init(
                    translations: [TranslateResponse.Translation.init(
                        translatedText: "My name is Valentin")
                                  ]
                )
            )
                                    ))
    }
    
    static var failure: MockTranslateRepository.Responses {
        return .init(
            ongetTranslate: .failure(MockError.mock)
        )
    }
    
    enum MockError: Error {
        case mock
    }
}
