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
    @IBOutlet var salaryTextField: UITextField!
    
    private var parameter: UserParameter?
    private var chosenYear: Int?
    private var chosenMonth: Month?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPullDownButton()
    }
    
    private func setPullDownButton() {
        let yearOptionClosure = { [weak self] (action: UIAction) in
            guard let self else { return }
            self.chosenYear = Int(action.title)
            self.updateParameter()
        }
                
        let monthOptionClosure = { [weak self] (action: UIAction) in
            guard let self else { return }
            let month = Month(rawValue: action.title)
            self.chosenMonth = month
            self.updateParameter()
        }


        yearButton.menu = UIMenu(children: [
            UIAction(title: "Выберите год...", state: .on, handler: yearOptionClosure),
            UIAction(title: Link.url2024.rawValue, handler: yearOptionClosure),
            UIAction(title: Link.url2023.rawValue, handler: yearOptionClosure),
            UIAction(title: Link.url2022.rawValue, handler: yearOptionClosure)]
        )
        
        yearButton.showsMenuAsPrimaryAction = true
        yearButton.changesSelectionAsPrimaryAction = true
        
        monthButton.menu = UIMenu(children: [
            UIAction(title: "Выберите месяц...", state: .on, handler: monthOptionClosure),
            UIAction(title: Month.january.rawValue, handler: monthOptionClosure),
            UIAction(title: Month.february.rawValue, handler: monthOptionClosure),
            UIAction(title: Month.march.rawValue, handler: monthOptionClosure),
            UIAction(title: Month.april.rawValue, handler: monthOptionClosure),
            UIAction(title: Month.may.rawValue, handler: monthOptionClosure),
            UIAction(title: Month.june.rawValue, handler: monthOptionClosure),
            UIAction(title: Month.july.rawValue, handler: monthOptionClosure),
            UIAction(title: Month.august.rawValue, handler: monthOptionClosure),
            UIAction(title: Month.september.rawValue, handler: monthOptionClosure),
            UIAction(title: Month.october.rawValue, handler: monthOptionClosure),
            UIAction(title: Month.november.rawValue, handler: monthOptionClosure),
            UIAction(title: Month.december.rawValue, handler: monthOptionClosure)]
        )
        
        monthButton.showsMenuAsPrimaryAction = true
        monthButton.changesSelectionAsPrimaryAction = true
    }
    
    private func updateParameter() {
        if let year = chosenYear, let month = chosenMonth {
            parameter = UserParameter(year: year, month: month)
            print(parameter ?? "")
        }
    }

}

