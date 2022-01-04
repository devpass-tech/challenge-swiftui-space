//
//  Response.swift
//  SpaceApp
//
//  Created by Rodrigo Borges on 04/01/22.
//

import Foundation

public enum Response {

    case result(Data)
    case error(Error?)
}
