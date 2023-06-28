//
//  NetworkingError.swift
//  RickAndMorty
//
//  Created by Rohit Lama on 28/06/2023.
//

import Foundation

enum NetworkError: Error {
    
    case networkNotInitialized,
         invalidURL,
         encodingFailed(Error),
         noConnection,
         unknown    
}

extension NetworkError: LocalizedError {
    
    var errorDescription: String {
        switch self {
        case .networkNotInitialized:
            return "Please initialize the network."
        case .invalidURL:
            return "Base URL is not a valid URL."
        case .encodingFailed(let error):
            return "Failed to decode json: \(error)"
        case .noConnection:
            return "A data connection cannot be made at the moment. Please check your network connection and try again."
        case .unknown:
            return "Something went wrong"
        }
    }
    
}

