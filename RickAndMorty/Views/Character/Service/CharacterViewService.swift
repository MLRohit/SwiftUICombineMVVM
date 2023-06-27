//
//  CharacterViewService.swift
//  RickAndMorty
//
//  Created by Rohit Lama on 27/06/2023.
//

import Foundation
import Combine

protocol CharacterViewServiceType {
    
    func fetchCharacter(with name: String) -> AnyPublisher<[Character], Error>
    
}

class CharacterViewService: CharacterViewServiceType {
    
    func fetchCharacter(with name: String) -> AnyPublisher<[Character], Error> {
        NetworkManager.shared.getData(endpoint: .character, name: name, type: [Character].self)
            .map({ $0.results ?? [] })
            .eraseToAnyPublisher()
    }

}

