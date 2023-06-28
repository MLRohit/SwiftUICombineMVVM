//
//  HomeView.swift
//  RickAndMorty
//
//  Created by Rohit Lama on 27/06/2023.
//

import SwiftUI
import Combine

struct CharacterView: View {
    
    // MARK: - Properties
    @ObservedObject var viewModel: CharacterViewViewModel
    @State private var searchText = ""
    
    // MARK: - View
    var body: some View {
        VStack {
            SearchBar(text: $searchText)
                .onChange(of: searchText) { value in
                    viewModel.fetchCharacters(with: value.removedSpaces)
                }
            List(viewModel.characters, id: \.id) { viewModel in
                Text(viewModel.name ?? "")
            }
            .listStyle(.plain)
            .background(.white)
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .onAppear {
            viewModel.fetchCharacters(with: searchText)
        }
        .alert(isPresented: $viewModel.showError) {
            Alert(title: Text(viewModel.error))
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(viewModel: CharacterViewViewModel(service: CharacterViewService()))
    }
}
