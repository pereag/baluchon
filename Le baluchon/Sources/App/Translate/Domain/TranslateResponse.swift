//
//  TranslateResponse.swift
//  Le baluchon
//
//  Created by Valc0d3 on 07/11/2021.
//

import Foundation

// MARK: - TranslateResponse
struct TranslateResponse: Codable {
    let data: DataClass
    
    // MARK: - DataClass
    struct DataClass: Codable {
        let translations: [Translation]
    }

    // MARK: - Translation
    struct Translation: Codable {
        let translatedText: String
    }
}
