//
//  ChangeRateRepository.swift
//  Le baluchon
//
//  Created by Valc0d3 on 05/11/2021.
//

import Foundation

protocol ChangeRateRepositoryType {
    func gateRate(callBack: @escaping (Result<ChangeRateResponse, Error>) -> Void)
}

class ChangeRateRepository: ChangeRateRepositoryType {
    
    // MARK: - Properties
    
    private let client: HTTPClientType
    private let parser: JSONParserType
    private let token = RequestCancellationToken()
    
    
    // MARK: - Init
    
    init(client: HTTPClientType, parser: JSONParserType) {
        self.client = client
        self.parser = parser
    }
    
    // MARK: - ChangeRateEndpoint
    
    func gateRate(callBack: @escaping (Result<ChangeRateResponse, Error>) -> Void) {
        let endpoint = ChangeRateEndpoint(
            accesKey: "71f2951733a72a5b29db871e9b12f2ac",
            moneyBase: "EUR",
            moneyTargeted: "USD"
        )
        guard let request = RequestBuilder().build(from: endpoint) else { return }
        client.send(
            request: request,
            token: token,
            completionHandler: { result in
                switch result {
                case .success(let data):
                    guard let response: Result<ChangeRateResponse, ParserError> = try? self.parser.processCodableResponse(from: data) else { return }
                    switch response {
                    case .success(let result):
                        callBack(.success(result))
                    case .failure(let error):
                        callBack(.failure(error))
                    }
                case .failure(let error):
                    callBack(.failure(error))
                }
            }
        )
    }
}
