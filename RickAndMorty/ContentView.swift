//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Rohit Lama on 27/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        let appConfig = NetworkingConfiguration(baseURL: "https://rickandmortyapi.com/api/")
        NetworkManager.initialize(with: appConfig)
    }
    
    var body: some View {
        CharacterView(viewModel: CharacterViewViewModel(service: CharacterViewService()))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
