//
//  String+Localized.swift
//  SpaceApp
//
//  Created by Gustavo Soares on 10/03/22.
//

import Foundation
import SwiftUI

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }

    var localizedStringKey: LocalizedStringKey {
        LocalizedStringKey(self)
    }
}
