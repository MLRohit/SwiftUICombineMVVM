//
//  String+Extensions.swift
//  RickAndMorty
//
//  Created by Rohit Lama on 28/06/2023.
//

import Foundation

extension String {
    
    var removedSpaces: String {
        return self.replacing(" ", with: "")
    }
    
}
