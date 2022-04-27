//
//  SPUIColorExtension.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 26/04/22.
//

import UIKit

struct SPUIColorExtension {
    
    var blueSelected: UIColor { makeColor(red: 52, green: 120, blue: 246) }
    var grayUnselected: UIColor { makeColor(red: 113, green: 113, blue: 113) }
    var darkGray: UIColor { makeColor(red: 29, green: 29, blue: 29) }
    
    let contentBlack: UIColor = .black
    
    //MARK: - Helpers
    private func makeColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        .init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
