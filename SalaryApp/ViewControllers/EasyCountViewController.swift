//
//  ViewController.swift
//  SalaryApp
//
//  Created by Варвара Уткина on 02.03.2024.
//

import UIKit

enum Link {
    case url2022
    case url2023
    case url2024
    
    var url: URL {
        switch self {
        case .url2022:
            return URL(string: "https://production-calendar.ru/get/ru/2022/json")!
        case .url2023:
            return URL(string: "https://production-calendar.ru/get/ru/2023/json")!
        case .url2024:
            return URL(string: "https://production-calendar.ru/get/ru/2024/json")!
        }
    }
}

final class EasyCountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

