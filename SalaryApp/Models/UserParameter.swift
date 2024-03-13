//
//  UserParameter.swift
//  SalaryApp
//
//  Created by Варвара Уткина on 13.03.2024.
//

import Foundation

struct UserParameter {
    let year: Int
    let month: Month
}

enum Month: String {
    case january = "Январь"
    case february = "Февраль"
    case march = "Март"
    case april = "Апрель"
    case may = "Май"
    case june = "Июнь"
    case july = "Июль"
    case august = "Август"
    case september = "Сентябрь"
    case october = "Октябрь"
    case november = "Ноябрь"
    case december = "Декабрь"
}
