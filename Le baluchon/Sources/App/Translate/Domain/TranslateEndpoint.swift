//
//  TranslateEndPoint.swift
//  Le baluchon
//
//  Created by Valc0d3 on 07/11/2021.
//

import Foundation

struct TranslateEndpoint: Endpoint {
    var method: HTTPMethod
    var path: String
    var queryParameters: [String : Any]?

    init(ApiKey: String, q: String, sourceLang: String, targetLang: String, textFormat: String ) {
        self.method = .POST
        self.path = "https://translation.googleapis.com/language/translate/v2"
        self.queryParameters = [
            "key": ApiKey,
            "q": q,
            "source": sourceLang,
            "target": targetLang,
            "format": textFormat
        ]
    }
}
