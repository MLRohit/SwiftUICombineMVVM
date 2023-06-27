//
//  View+Extensions.swift
//  KFCSWIFTUI
//
//  Created by ekmacmini37 on 14/02/2023.
//

import Foundation
import SwiftUI


extension View {
    
    var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    var topSafeArea: CGFloat {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        
        return (keyWindow?.safeAreaInsets.top) ?? 0
    }
    
    func getWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    func getHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
    func getHeight(with ratio: (width: CGFloat, height: CGFloat)) -> CGFloat {
        let width = getWidth()
        return width + ratio.height/ratio.width
    }
    
}
