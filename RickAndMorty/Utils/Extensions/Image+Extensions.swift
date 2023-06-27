//
//  Image+Extensions.swift
//  KFCSWIFTUI
//
//  Created by ekmacmini37 on 20/02/2023.
//

import Foundation
import SwiftUI

extension Image {
    
    func data(url: String) -> Self {
        if let url = URL(string: url),
            let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        
        return self.resizable()
    }
    
}
