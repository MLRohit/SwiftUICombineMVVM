//
//  NetworkingConfigurations.swift
//  RickAndMorty
//
//  Created by Rohit Lama on 28/06/2023.
//

import Foundation

public struct NetworkingConfiguration {
    
    // MARK: - Properties
    let baseURL: String
    
    // MARK: - Initializers
    public init(baseURL: String) {
        self.baseURL = baseURL
    }
    
}
