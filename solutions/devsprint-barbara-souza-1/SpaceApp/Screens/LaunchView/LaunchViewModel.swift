//
//  LaunchViewModel.swift
//  SpaceApp
//
//  Created by Mobile2you on 29/01/22.
//

import Foundation
import SwiftUI

class LaunchViewModel: ObservableObject {
    
    //MARK: - Constants
    let navigationViewTitle = "Launches"
    
    //MARK: - Variables
    @Published var launchRowCellNumberList: [LaunchRowViewModel]
    
    private var service: SpaceXAPI

    //MARK: - Init
    init(service: SpaceXAPI = SpaceXAPI()) {
        self.service = service
        launchRowCellNumberList = []
    }
    
    //MARK: - Functions
    func onAppear() {
        service
            .fetchLaunches(query: LaunchesQuery(options: LaunchesQuery.Options(limit: 20))) { [weak self] launches in
                guard
                    let self = self,
                    let launches = launches
                else { return }
                
                let launchesList = launches.compactMap { launch in
                    return LaunchRowViewModel(launchPatchURL: launch.links.patch.small,
                                              launchName: launch.name,
                                              launchDate: launch.data,
                                              launchStatus: launch.success ? "Success" : "Failure",
                                              launchNumber: "#\(launch.flightNumber)")
                }
                
                self.launchRowCellNumberList = launchesList
            }
    }
}
