//
//  DateExtension.swift
//  GfgChallenge
//
//  Created by Flexnest on 26/01/22.
//

import Foundation

extension Date {
    public var year: Int {
        return Calendar.current.component(Calendar.Component.year, from: self)
    }

    public var monthAsString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }

    public var day: Int {
        return Calendar.current.component(.day, from: self)
    }

    public var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }

    public var minute: Int {
        return Calendar.current.component(.minute, from: self)
    }
}
