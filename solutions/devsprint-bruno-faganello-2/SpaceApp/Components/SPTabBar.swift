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
            let service = SpaceXAPI()
            let viewModel = HomeViewModel(service: service)
            HomeView(viewModel: viewModel)
                .tabItem {
                    SPTabBarPages.home.icon.image
                    Text(SPTabBarPages.home.tabBarName)
                }
            
            LaunchView()
                .tabItem {
                    SPTabBarPages.launch.icon.image
                    Text(SPTabBarPages.launch.tabBarName)
                }
        }
    }
    
    private func setupTabBarStyle() {
        UITabBar.appearance().isOpaque = true
        UITabBar.appearance().barTintColor = .darkGray
        UITabBar.appearance().unselectedItemTintColor = .grayUnselected
        UITabBar.appearance().backgroundColor = .darkGray
    }
}

struct SPTabBar_Previews: PreviewProvider {
    static var previews: some View {
        SPTabBar()
    }
}
