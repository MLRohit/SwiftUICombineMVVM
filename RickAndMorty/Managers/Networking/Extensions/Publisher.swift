//
//  Publisher.swift
//  RickAndMorty
//
//  Created by Rohit Lama on 27/06/2023.
//

import Foundation
import Combine

extension Publisher where Output == (data: Data, response: URLResponse) {

    func parse() -> Publishers.TryMap<Self, (data: Data, response: URLResponse)> {
        return tryMap { response -> (data: Data, response: URLResponse) in
            try ResponseParser(result: response).parse()
            return response
        }
    }
    
}

extension Publisher {
    
    func handleResult(promise: @escaping (Result<Output, Failure>) -> Void) -> AnyCancellable {
        return sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case let .failure(error):
                promise(.failure(error))
            }
        }, receiveValue: { value in
            promise(.success(value))
        })
    }
    
}
