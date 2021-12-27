//
//  TranslateRepository.swift
//  Le baluchon
//
//  Created by Valc0d3 on 05/11/2021.
//

import Foundation

protocol TranslateRepositoryType {
    func getTranslation(for phrase: String, callBack: @escaping (Result<TranslateResponse, Error>) -> Void)
}

final class TranslateRepository: TranslateRepositoryType {
    
    // MARK: - Properties
    
    private let client: HTTPClientType
    private let parser: JSONParserType
    private let token = RequestCancellationToken()
    
    
    // MARK: - Init
    
    init(client: HTTPClientType, parser: JSONParserType) {
        self.client = client
        self.parser = parser
    }
    
    // MARK: - TranslateEndpoint
    
    func getTranslation(for phrase: String, callBack: @escaping (Result<TranslateResponse, Error>) -> Void) {
        let endpoint = TranslateEndpoint(
            ApiKey: ApiKeys.google.rawValue,
            q: phrase,
            sourceLang: "fr",
            targetLang: "en",
            textFormat: "text"
        )
        guard let request = RequestBuilder().build(from: endpoint) else { return }
        client.send(
            request: request,
            token: token,
            completionHandler: { result in
                switch result {
                case .success(let data):
                    guard let response: Result<TranslateResponse, ParserError> = try? self.parser.processCodableResponse(from: data) else { return }
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
