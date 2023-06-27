//
//  HomeView.swift
//  RickAndMorty
//
//  Created by Rohit Lama on 27/06/2023.
//

import SwiftUI

struct CharacterView: View {
    
    @ObservedObject var viewModel: CharacterViewViewModel
    
    @State private var searchText = ""
//    @State private var items = ["Apple", "Banana", "Orange", "Pear"]
//
//    var filteredItems: [String] {
//        if searchText.isEmpty {
//            return items
//        } else {
//            return items.filter { $0.localizedCaseInsensitiveContains(searchText) }
//        }
//    }
    
    var body: some View {
        //        Text("Hello, World!")
        VStack {
            SearchBar(text: $searchText)
                .onChange(of: searchText) { value in
                    let searchText = value.replacing(" ", with: "")
                    viewModel.fetchCharacters(with: searchText)
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
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(viewModel: CharacterViewViewModel(service: CharacterViewService()))
    }
}
