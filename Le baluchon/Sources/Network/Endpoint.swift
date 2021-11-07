//
//  Endpoint.swift
//  Le baluchon
//
//  Created by Valc0d3 on 08/10/2021.
//

import Foundation

enum HTTPMethod {
    case GET
    case POST
}

protocol Endpoint {
    var method: HTTPMethod { get }
    var path: String { get }
    var queryParameters: [String: Any]? { get }
}
