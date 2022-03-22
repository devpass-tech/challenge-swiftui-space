//
//  HTTPResponseData.swift
//  SpaceApp
//
//  Created by vinicius.carvalho on 18/03/22.
//

import Foundation

struct HTTPResponseData: Equatable {
    public let data: Data
    public let statusCode: Int

    public init(
        data: Data,
        statusCode: Int
    ) {
        self.data = data
        self.statusCode = statusCode
    }
}
