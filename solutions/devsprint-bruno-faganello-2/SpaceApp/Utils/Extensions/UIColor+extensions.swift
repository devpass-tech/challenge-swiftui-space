//
//  UIColor+extensions.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 26/04/22.
//

import UIKit

extension UIColor {
    static let grayUnselected: UIColor = makeColor(red: 113, green: 113, blue: 113)
    static let darkGray: UIColor = makeColor(red: 29, green: 29, blue: 29)
    
    //MARK: - Helpers
    private static func makeColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        .init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

