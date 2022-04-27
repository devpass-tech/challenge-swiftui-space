//
//  SPTabBar.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 26/04/22.
//

import SwiftUI

struct SPTabBar: View {
    var body: some View {
        setupTabBarStyle()
        return makeTabBar()
    }
    
    private func makeTabBar() -> some View {
        setupTabBarStyle()
        
        return TabView {
            HomeView()
                .tabItem {
                    SPTabBarPages.home.icon.image
                    SPTabBarPages.home.tabBarName.SP.asText
                }
            
            LaunchView()
                .tabItem {
                    SPTabBarPages.launch.icon.image
                    SPTabBarPages.launch.tabBarName.SP.asText
                }
        }
    }
    
    private func setupTabBarStyle() {
        UITabBar.appearance().isOpaque = true
        UITabBar.appearance().barTintColor = .SP.darkGray
        UITabBar.appearance().unselectedItemTintColor = .SP.grayUnselected
        UITabBar.appearance().backgroundColor = .SP.darkGray
    }
}

struct SPTabBar_Previews: PreviewProvider {
    static var previews: some View {
        SPTabBar()
    }
}

extension UIColor {
    static var SP: SPUIColorExtension { .init() }
}

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


extension Color {
 
    func uiColor() -> UIColor {

        if #available(iOS 14.0, *) {
            return UIColor(self)
        }

        let components = self.components()
        return UIColor(red: components.r, green: components.g, blue: components.b, alpha: components.a)
    }

    private func components() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {

        let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0

        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000ff) / 255
        }
        return (r, g, b, a)
    }
}
