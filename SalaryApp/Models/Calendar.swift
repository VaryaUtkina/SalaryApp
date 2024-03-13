//
//  Calendar.swift
//  SalaryApp
//
//  Created by Варвара Уткина on 13.03.2024.
//

import Foundation

struct Calendar: Decodable {
    let days: [DayInfo]
}

struct DayInfo: Decodable {
    let day: String
    let typeId: Int
}
