//
//  URLSession.swift
//  RickAndMorty
//
//  Created by Rohit Lama on 28/06/2023.
//

import Foundation
import Combine

extension URLSession {
    
    func taskPublisher(for url: URL) -> AnyPublisher<(data: Data, response: URLResponse), URLError> {
        return dataTaskPublisher(for: url)
            .eraseToAnyPublisher()
    }
    
}
