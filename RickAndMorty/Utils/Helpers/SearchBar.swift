//
//  SearchBar.swift
//  RickAndMorty
//
//  Created by Rohit Lama on 27/06/2023.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "magnifyingglass")
                .padding(.leading, 16)
                .foregroundColor(.gray)
            TextField("Search", text: $text)
                .cornerRadius(16)
            Button(action: {
                // Clear the search text
                text = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
                    .padding(.trailing, 16)
            }
        }
        .frame(height: 60)
        .cornerRadius(16)
        .border(GlobalConstants.Colors.searchBarBorderColor, width: 1)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Rick"))
            .previewLayout(.sizeThatFits)
    }
}
