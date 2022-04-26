//
//  SPTabBar.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 25/04/22.
//

import SwiftUI

fileprivate typealias Constants = SPConstants.SPTabBar

struct SPTabBar: View {
    //MARK: - Properties
    @State private var currentPage: SPTabBarPages = .home
    
    //MARK: - Body
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: Constants.bodyVStackSpacing) {
                getTabBarView()
                    .frame(height: Constants.viewHeightWithouTabBarSize)
                getTabBarIcon(geo: geo)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.SP.darkGray)
    }
    
    //MARK: - Helpers
    private func getTabBarView() -> some View {
        switch currentPage {
        case .home:
            let homeView = HomeView()
            return homeView.SP.asAnyView
        case .launch:
            let launchView = LaunchView()
            return launchView.SP.asAnyView
        }
    }
    
    private func getTabBarIcon(geo: GeometryProxy) -> some View {
        let iconWidth = geo.size.width / Constants.numberOfIcons
        let iconHeight = geo.size.height / Constants.heightOfIcons
        
        let tabBarView = HStack {
            SPTabBarIconImage(
                currentPageSelected: $currentPage, page: .home,
                heighIcon: iconHeight, widthIcon: iconWidth
            )
            
            SPTabBarIconImage(
                currentPageSelected: $currentPage, page: .launch,
                heighIcon: iconHeight, widthIcon: iconWidth
            )
        }
            .frame(width: geo.size.width, height: Constants.tabBarHeight)
            .padding(.bottom, Constants.tabPaddingBottom)
        
        return tabBarView
    }
}

//MARK: - PreviewProvider
struct SPTabBar_Previews: PreviewProvider {
    static var previews: some View {
        SPTabBar()
    }
}
