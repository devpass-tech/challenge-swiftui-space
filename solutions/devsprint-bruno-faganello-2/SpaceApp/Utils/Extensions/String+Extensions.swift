//
//  String+Extensions.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 02/05/22.
//

import Foundation

extension String {
    
    static var emptyString: String { "" }
    
    var dateFormattedFromUTC: String {
        let fromFormatter: DateFormatter = .init()
        fromFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        fromFormatter.timeZone = .init(abbreviation: "UTC")
        
        let date = fromFormatter.date(from: self) ?? Date()
        
        let toFormatter: DateFormatter = .init()
        toFormatter.dateFormat = "MMMM d, yyyy"
        
        return toFormatter.string(from: date)
    }
}
