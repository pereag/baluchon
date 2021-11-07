//
//  ChangeRateEndpoint.swift
//  Le baluchon
//
//  Created by Valc0d3 on 07/11/2021.
//

import Foundation

struct ChangeRateEndpoint: Endpoint {
    var method: HTTPMethod
    var path: String
    var queryParameters: [String : Any]?

    init(accesKey: String, moneyBase: String, moneyTargeted: String) {
        self.method = .GET
        self.path = "http://data.fixer.io/api/latest"
        self.queryParameters = [
            "access_key": accesKey,
            "base": moneyBase,
            "symbols": moneyTargeted
        ]
    }
}
