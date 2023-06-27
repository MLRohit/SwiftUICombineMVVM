//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Rohit Lama on 27/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CharacterView(viewModel: CharacterViewViewModel(service: CharacterViewService()))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
