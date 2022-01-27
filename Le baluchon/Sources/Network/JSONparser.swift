//
//  JSONparser.swift
//  Le baluchon
//
//  Created by Valc0d3 on 07/11/2021.
//

import Foundation

enum ParserError: Error, Equatable {
    case badParsing(String?)
    static func == (lhs: ParserError, rhs: ParserError) -> Bool {
        return String(describing: lhs) == String(describing: rhs)
    }
}

protocol JSONParserType {
    func processCodableResponse<C: Codable>(from data: Data) throws -> Result<C, ParserError>
}

final class JSONParser: JSONParserType {
    func processCodableResponse<C: Codable>(from data: Data) throws -> Result<C, ParserError> {
        do {
            let object = try JSONDecoder().decode(C.self, from: data)
            return .success(object)
        } catch let error {
            return .failure(ParserError.badParsing("\(error)"))
        }
    }
}
