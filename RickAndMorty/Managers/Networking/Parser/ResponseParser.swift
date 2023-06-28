//
//  ResponseParser.swift
//  RickAndMorty
//
//  Created by Rohit Lama on 27/06/2023.
//

import Foundation

struct ResponseParser {
    let result: (data: Data, response: URLResponse)
    
    // parse the data from response
    func parse() throws {
        guard let urlResponse = result.response as? HTTPURLResponse else { assertionFailure(); return }
        guard !(200...299 ~= urlResponse.statusCode) else { return }
        throw NetworkError.unknown
    }
}
