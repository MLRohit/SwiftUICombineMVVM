//
//  ApiResponse.swift
//  RickAndMorty
//
//  Created by Rohit Lama on 27/06/2023.
//

import Foundation

struct ApiResponse<T: Codable>: Codable {
    
    var info: Info?
    var results: T?
    
}


struct Info: Codable {
    
    let count,
        pages: Int?
    let next: String?
    let prev: String?
    
}
