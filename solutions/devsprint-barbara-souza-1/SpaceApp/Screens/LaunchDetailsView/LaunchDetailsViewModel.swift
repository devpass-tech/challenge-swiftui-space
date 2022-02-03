//
//  LaunchDetailsViewModel.swift
//  SpaceApp
//
//  Created by Pedro Gabriel on 28/01/22.
//

import Foundation

protocol LaunchDetailsViewModelRepresentable: ObservableObject {
    var headerViewModel: DetailsHeaderViewModel { get }
    var detailsViewModel: InfoRowViewModelRepresentable { get }
    var infoViewModel: InfoRowViewModelRepresentable { get }
    func rocketDetailsOnAppear(rocketID: String)
}

class LaunchDetailsViewModel: LaunchDetailsViewModelRepresentable {

    @Published var headerViewModel: DetailsHeaderViewModel = .init()
    @Published var detailsViewModel: InfoRowViewModelRepresentable = DetailsInfoRowViewModel()
    @Published var infoViewModel: InfoRowViewModelRepresentable = InfoRowViewModel()

    private var service: SpaceXAPIRocketDetails

    init(service: SpaceXAPIRocketDetails = SpaceXAPIRocketDetails() ) {
        self.service = service

    }

    func rocketDetailsOnAppear(rocketID: String) {
        service
            .fetchRocketDetails(rocketID: rocketID){ [weak self] details in
                guard
                    let self = self,
                    let details = details
                else { return }

                let rocketDetails = InfoRowViewModel(title: details.type, subtitle: details.company, description: details.description, buttonText: "See more")

                self.infoViewModel = rocketDetails
            }
    }
}


