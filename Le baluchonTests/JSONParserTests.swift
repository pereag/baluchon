//
//  JSONparserTest.swift
//  Le baluchonTests
//
//  Created by Valc0d3 on 24/01/2022.
//

import XCTest
@testable import Le_baluchon

final class JSONparserTests: XCTestCase {

    static let validJSONData = """
    {
        "name": "toto",
        "lastName": "tata"
    }
    """.data(using: .utf8)!
    
    static let inValidJSONData = """
    {
        "name": "toto"fgtghdc'd''",
        "lastName": "tata"
    }
    """.data(using: .utf8)!

    func testWhenProcessColableResponseFromCorrectDecodeDataItReturnSucess () {
        // GIVEN
        let jsonParser = JSONParser()

        // WHEN
        let result: Result<MockCodable, ParserError> = try! jsonParser.processCodableResponse(from: JSONparserTests.validJSONData)

        // THEN
        let expectedResult: Result<MockCodable, ParserError> = .success(MockCodable(name: "toto", lastName: "tata"))
        XCTAssertEqual(result, expectedResult)
    }
    
    func testWhenProcessColableResponseFromFailureDecodeDataItReturnError () {
            // GIVEN
            let jsonParser = JSONParser()

            // WHEN
            let result: Result<MockCodable, ParserError> = try! jsonParser.processCodableResponse(from: JSONparserTests.inValidJSONData)

            // THEN
        let expectedResult: Result<MockCodable, ParserError> = .failure(ParserError.badParsing)
            XCTAssertEqual(result, expectedResult)
        }
}


private struct MockCodable: Codable, Equatable {
    let name: String
    let lastName: String
}

