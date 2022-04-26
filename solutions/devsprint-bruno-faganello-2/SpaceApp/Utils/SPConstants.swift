//
//  SPConstants.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 25/04/22.
//

import UIKit

struct SPConstants {
    
    struct SPTabBar {
        static let bodyVStackSpacing: CGFloat = -10
        static let viewHeightWithouTabBarSize: CGFloat = (UIScreen.main.bounds.height - Self.tabBarHeight)
        static let tabBarHeight: CGFloat = 70
        static let tabPaddingBottom: CGFloat = -15
        static let numberOfIcons: CGFloat = 4
        static let heightOfIcons: CGFloat = 36
    }
    
    struct SPTabBarIconImage {
        static let imagePaddginTop: CGFloat = 10
        static let VStackHorizontalPaddin: CGFloat = -4
        static let previewIconHeight: CGFloat = 54
    }
}
