//
//  ChangeRateResponse.swift
//  Le baluchon
//
//  Created by Valc0d3 on 07/11/2021.
//

import Foundation

// MARK: - ChangeRateResponse

struct ChangeRateResponse: Codable {
    let success: Bool
    let timestamp: Int
    let base, date: String
    let rates: Rates
    
    // MARK: - Rates
    
    struct Rates: Codable {
        let usd: Double

        enum CodingKeys: String, CodingKey {
            case usd = "USD"
        }
    }
}
