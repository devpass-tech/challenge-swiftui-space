//
//  SPTabBarPages.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 25/04/22.
//

enum SPTabBarPages {
    
    //MARK: - Cases
    case home
    case launch
    
    //MARK: - Computed properties
    var icon: SPSystemIconsConstants {
        switch self {
        case .home: return .houseFill
        case .launch: return .locationNorthFill
        }
    }
    
    var tabBarName: String {
        switch self {
        case .home: return "Home"
        case .launch: return "Launches"
        }
    }
}
