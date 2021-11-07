//
//  WeatherRepository.swift
//  Le baluchon
//
//  Created by Valc0d3 on 05/11/2021.
//

import Foundation

protocol WeatherRepositoryType {
    func getWeatherInfo(callBack: @escaping (Result<WeatherResponse, Error>) -> Void)
}

final class WeatherRepository: WeatherRepositoryType {
    
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
    
    func getWeatherInfo(callBack: @escaping (Result<WeatherResponse, Error>) -> Void) {
        let endpoint = WeatherEndpoint(
            q: "lyon",
            appid: "8e81245c4c9ba68876e7cfefbe293380",
            lang: "fr",
            units: "metric"
        )
        guard let request = RequestBuilder().build(from: endpoint) else { return }
        client.send(
            request: request,
            token: token,
            completionHandler: { result in
                switch result {
                case .success(let data):
                    guard let response: Result<WeatherResponse, ParserError> = try? self.parser.processCodableResponse(from: data) else { return }
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
