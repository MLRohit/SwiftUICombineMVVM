//
//  HomeViewModel.swift
//  RickAndMorty
//
//  Created by Rohit Lama on 27/06/2023.
//

import Foundation
import Combine

class CharacterViewViewModel: BaseViewModel {
    
    // MARK: - Properties
    let service: CharacterViewServiceType

    @Published var characters = [Character]()
    @Published var showError = false
    @Published var error = ""
    
    // MARK: - Initializer
    init(service: CharacterViewService) {
        self.service = service
        super.init()
    }
    
    // MARK: - Other Functions
    func fetchCharacters(with name: String) {
        service.fetchCharacter(with: name)
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.error = error.errorDescription
                    self?.showError = true
                case .finished:
                    self?.error = ""
                    self?.showError = false
                    break
                }
            } receiveValue: { [weak self] models in
                self?.characters = models
            }
            .store(in: &cancellables)
    }
    
}
