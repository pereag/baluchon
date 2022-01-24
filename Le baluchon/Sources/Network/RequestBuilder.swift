//
//  RequestBuilder.swift
//  Le baluchon
//
//  Created by Valc0d3 on 08/10/2021.
//

import Foundation

final class RequestBuilder {
    func build(from endpoint: Endpoint) -> URLRequest? {
        guard let url = url(from: endpoint.path, queryParameters: endpoint.queryParameters) else {
            return nil
        }
        
        return URLRequest(url: url)
    }
    
    private func url(from path: String, queryParameters: [String: Any]?) -> URL? {
        guard var components = URLComponents(string: path) else {
            return nil
        }
        
        guard let queryParameters = queryParameters else {
            return components.url
        }
        
        components.queryItems = queryParameters
            .map({ (key, value) -> (String, String) in
                return (key, "\(value)")
            })
            .map { URLQueryItem(name: $0, value: $1) }
        
        return components.url
    }
}
