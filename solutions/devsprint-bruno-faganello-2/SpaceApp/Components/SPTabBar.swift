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
    
    @MainActor private func makeTabBar() -> some View {
        setupTabBarStyle()
        
        return TabView {
            
            let homeService = SpaceXAPI()
            let homeViewModel = HomeViewModel(service: homeService)
            HomeView(viewModel: homeViewModel)
                .tabItem {
                    SPTabBarPages.home.icon.image
                    Text(SPTabBarPages.home.tabBarName)
                }
            
            let launchesService = SpaceXAPI()
            let launchesViewModel = LaunchViewModel(service: launchesService)
            LaunchView(viewModel: launchesViewModel)
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
