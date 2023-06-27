//
//  HomeViewModel.swift
//  RickAndMorty
//
//  Created by Rohit Lama on 27/06/2023.
//

import Foundation
import Combine

class CharacterViewViewModel: ObservableObject {
    
    let service: CharacterViewServiceType
    private var cancellables = Set<AnyCancellable>()

    @Published var characters = [Character]()
    
    init(service: CharacterViewService) {
        self.service = service
    }
    
    func fetchCharacters(with name: String) {
        service.fetchCharacter(with: name)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("API Request error: \(error)")
                case .finished:
                    break
                }
            } receiveValue: { [weak self] models in
                self?.characters = models
            }
            .store(in: &cancellables)
    }
    
}
