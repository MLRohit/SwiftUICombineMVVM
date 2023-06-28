//
//  HTTPMethod.swift
//  RickAndMorty
//
//  Created by Rohit Lama on 28/06/2023.
//

import Foundation

public enum HTTPMethod {
    
    case get,
         post,
         put,
         delete,
         patch
    
}

extension HTTPMethod {
    
    var identifier: String {
        switch self {
        case .get: return "GET"
        case .post: return "POST"
        case .put: return "PUT"
        case .delete: return "DELETE"
        case .patch: return "PATCH"
        }
    }
    
}
