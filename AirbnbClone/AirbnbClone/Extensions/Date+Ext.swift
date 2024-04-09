//
//  Date+Ext.swift
//  AirbnbClone
//
//  Created by Oleksandr Isaiev on 09.04.2024.
//

import Foundation

extension Date {

    var oneYearInFuture: Date {
        Calendar.current.date(byAdding: .year, value: 1, to: Date())!
    }
}
