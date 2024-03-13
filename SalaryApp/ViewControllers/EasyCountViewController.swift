//
//  ViewController.swift
//  SalaryApp
//
//  Created by Варвара Уткина on 02.03.2024.
//

import UIKit

enum Link: String {
    case url2022 = "2022"
    case url2023 = "2023"
    case url2024 = "2024"
    
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
    @IBOutlet var yearButton: UIButton!
    @IBOutlet var monthButton: UIButton!
    
    private var parameter = UserParameter(year: 0, month: .january)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPullDownButton()
    }
    
    private func setPullDownButton() {
        let optionClosure = { (action: UIAction) in
        }
        
        yearButton.menu = UIMenu(children: [
            UIAction(title: "Выберите год...", state: .on, handler: optionClosure),
            UIAction(title: Link.url2024.rawValue, handler: optionClosure),
            UIAction(title: Link.url2023.rawValue, handler: optionClosure),
            UIAction(title: Link.url2022.rawValue, handler: optionClosure)]
        )
        
        yearButton.showsMenuAsPrimaryAction = true
        yearButton.changesSelectionAsPrimaryAction = true
        
        monthButton.menu = UIMenu(children: [
            UIAction(title: "Выберите месяц...", state: .on, handler: optionClosure),
            UIAction(title: Month.january.rawValue, handler: optionClosure),
            UIAction(title: Month.february.rawValue, handler: optionClosure),
            UIAction(title: Month.march.rawValue, handler: optionClosure),
            UIAction(title: Month.april.rawValue, handler: optionClosure),
            UIAction(title: Month.may.rawValue, handler: optionClosure),
            UIAction(title: Month.june.rawValue, handler: optionClosure),
            UIAction(title: Month.june.rawValue, handler: optionClosure),
            UIAction(title: Month.august.rawValue, handler: optionClosure),
            UIAction(title: Month.september.rawValue, handler: optionClosure),
            UIAction(title: Month.october.rawValue, handler: optionClosure),
            UIAction(title: Month.november.rawValue, handler: optionClosure),
            UIAction(title: Month.december.rawValue, handler: optionClosure)]
        )
        
        monthButton.showsMenuAsPrimaryAction = true
        monthButton.changesSelectionAsPrimaryAction = true
    }


}

