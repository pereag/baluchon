//
//  HTTPClient.swift
//  Le baluchon
//
//  Created by Valc0d3 on 24/09/2021.
//

import Foundation


enum HTTPClientError: Error {
    case badRequest
    case invalidData
}

protocol HTTPClientType {
    func send(request: URLRequest, token: RequestCancellationToken, completionHandler: @escaping (Result<Data, Error>) -> Void)
}

final class HTTPClient: HTTPClientType {

    private let session: URLSession

    init() {
        self.session = URLSession(configuration: .default)
    }
    
    func send(
        request: URLRequest,
        token: RequestCancellationToken,
        completionHandler: @escaping (Result<Data, Error>) -> Void
    ) {
        let task = self.session.dataTask(with: request) { data, response, error in
            if let error = error {
                completionHandler(.failure(error))
                return
            }

            guard
                response != nil,
                let response = response as? HTTPURLResponse,
                Array(200..<300).contains(response.statusCode)
            else {
                completionHandler(.failure(HTTPClientError.badRequest))
                return
            }

            guard let data = data, !data.isEmpty else {
                completionHandler(.failure(HTTPClientError.invalidData))
                return
            }

            completionHandler(.success(data))
        }

        task.resume()

        token.willDeallocate = {
            task.cancel()
        }
    }
}
