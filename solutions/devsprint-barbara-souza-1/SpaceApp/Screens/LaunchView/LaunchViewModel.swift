//
//  LaunchViewModel.swift
//  SpaceApp
//
//  Created by Mobile2you on 29/01/22.
//

import Foundation
import SwiftUI

struct LaunchViewModel {
    
    //MARK: - Constants
    let navigationViewTitle = "Launches"
    
    //MARK: - Variables
    var launchRowCellNumberList = [LaunchRowView]()
        
    //MARK: - Init
    init() {
        populateLaunchRowCellNumberList(with: 5)
    }
    
    //MARK: - Functions
    mutating func populateLaunchRowCellNumberList(with quantity: Int) {
        for _ in (0..<quantity) {
            self.launchRowCellNumberList.append(LaunchRowView())
        }
    }
}
