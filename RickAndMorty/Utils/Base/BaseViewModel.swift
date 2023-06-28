//
//  BaseViewModel.swift
//  RickAndMorty
//
//  Created by Rohit Lama on 28/06/2023.
//

import Foundation
import Combine

open class BaseViewModel: ObservableObject {
    
    var cancellables = Set<AnyCancellable>()
        
}
