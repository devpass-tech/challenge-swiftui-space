//
//  NetworkStatusManager.swift
//  SpaceApp
//
//  Created by vinicius.carvalho on 18/03/22.
//

import Foundation
import UIKit

protocol NetworkStatusManaging {
    func isNetworkReachable() -> Bool
}

final class NetworkStatusManager: NetworkStatusManaging {

    // MARK: - Private Properties

    private let monitorQueue: DispatchQueue
    private var isConnectionActive: Bool = false

    // MARK: - Singleton

    static let shared = NetworkStatusManager()

    // MARK: - Initialization

    init(
        monitorQueue: DispatchQueue = .global()
    ) {
        self.monitorQueue = monitorQueue
    }

    // MARK: - Public API

    func isNetworkReachable() -> Bool {
        isConnectionActive
    }
}
