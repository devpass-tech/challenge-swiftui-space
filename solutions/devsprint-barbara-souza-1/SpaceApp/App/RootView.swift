//
//  RootView.swift
//  SpaceApp
//
//  Created by Pedro Gabriel on 28/01/22.
//

import SwiftUI

struct RootView: View {
    // MARK: Initializer
    init() {
        UITabBar.appearance().barTintColor = .clear
    }

    // MARK: Body
    var body: some View {
        TabView {
            homeTab
            launchesTab
        }
    }

    // MARK: Tabs
    var homeTab: some View {
        HomeView()
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
    }

    var launchesTab: some View {
        buildLaunchDetailsView()
            .tabItem {
                Image(systemName: "location.north.fill")
                Text("Launches")
            }
    }

    // MARK: View Builders
    private func buildLaunchDetailsView() -> LaunchDetailsView {
        LaunchDetailsView(viewModel: LaunchDetailsViewModel(),
                          pressedSeeMoreDetails: {},
                          pressedSeeMoreInfo: {})

    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
