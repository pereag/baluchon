//
//  RequestBuilderTests.swift
//  Le baluchonTests
//
//  Created by Valc0d3 on 24/01/2022.
//


import XCTest
@testable import Le_baluchon

final class RequestBuilderTests: XCTestCase {
    func testWhenBuildFromValidEndpointItReturnsUrlRequest() {
        // GIVEN
        let requestBuilder = RequestBuilder()
    
        //WHEN
        let mock = ValidMockEndpoint()
        let result = requestBuilder.build(from: mock)
        
        //THEN
        XCTAssertEqual(result?.url, URL(string: "http://www.ggoel.com?key=value")!)
    }
    
    func testWhenBuildFromInvalidEndpointItReturnsNil() {
        // GIVEN
        let requestBuilder = RequestBuilder()
        
        //WHEN
        let mock = FailureMockEndpoint()
        let result = requestBuilder.build(from: mock)
        
        //THEN
        XCTAssertNil(result)
    }
}

private class ValidMockEndpoint: Endpoint {
    var method: HTTPMethod = .GET
    var path: String = "http://www.ggoel.com"
    var queryParameters: [String : Any]? = ["key": "value"]
}

private class FailureMockEndpoint: Endpoint {
    var method: HTTPMethod = .POST
    var path: String = "Hello it's me"
    var queryParameters: [String : Any]? = nil
}
