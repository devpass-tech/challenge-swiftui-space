//
//  LaunchRowViewModel.swift
//  SpaceApp
//
//  Created by Mobile2you on 27/01/22.
//

import Foundation

struct LaunchRowViewModel {
    let launchPatchURL: String
    let launchName: String
    let launchDate: String
    let launchStatus: String
    let launchNumber: String
    
    let patchImageFailureWarning = "Failed fetching image. Make sure to check your data connection and try again."
    let patchImageUnknownError = "Unknown error. Try again."
}
