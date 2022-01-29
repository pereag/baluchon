//
//  JSONparser.swift
//  Le baluchon
//
//  Created by Valc0d3 on 07/11/2021.
//

import Foundation

enum ParserError: Error, Equatable {
    case badParsing
}

protocol JSONParserType {
    func processCodableResponse<C: Codable>(from data: Data) throws -> Result<C, ParserError>
}

final class JSONParser: JSONParserType {
    func processCodableResponse<C: Codable>(from data: Data) throws -> Result<C, ParserError> {
        do {
            let object = try JSONDecoder().decode(C.self, from: data)
            return .success(object)
        } catch {
            return .failure(ParserError.badParsing)
        }
    }
}
