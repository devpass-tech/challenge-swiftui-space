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
