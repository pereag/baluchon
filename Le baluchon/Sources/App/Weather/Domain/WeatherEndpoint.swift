//
//  weatherEndpoint.swift
//  Le baluchon
//
//  Created by Valc0d3 on 07/11/2021.
//

import Foundation

struct WeatherEndpoint: Endpoint {
    var method: HTTPMethod
    var path: String
    var queryParameters: [String : Any]?

    init(q: String, appid: String, lang: String,  units: String) {
        self.method = .GET
        self.path = "https://api.openweathermap.org/data/2.5/weather"
        self.queryParameters = [
            "q": q,
            "appid": appid,
            "lang" : lang,
            "units": units
            
            
        ]
    }
}
