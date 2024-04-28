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

final class SalaryViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet var yearButton: UIButton!
    @IBOutlet var monthButton: UIButton!
    @IBOutlet var salaryTextField: UITextField!
    
    // MARK: - Private Properties
    private var parameter: UserParameter!
    private var chosenYear: Int!
    private var chosenMonth: Month!

    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPullDownButton()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationVC = segue.destination as? UINavigationController
        let detailsVC = navigationVC?.topViewController as? SalaryDetailsViewController
        detailsVC?.parameter = parameter
    }
    
    // MARK: - Override Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IB Actions
    @IBAction func calculateAction(_ sender: UIButton) {
        updateParameter()
        if parameter != nil {
            performSegue(withIdentifier: "showDetails", sender: nil)
        } else {
            showAlert()
        }
    }
    
    // MARK: - Private Methods
    private func setPullDownButton() {
        let yearOptionClosure = { [weak self] (action: UIAction) in
            guard let self else { return }
            self.chosenYear = Int(action.title)
        }
                
        let monthOptionClosure = { [weak self] (action: UIAction) in
            guard let self else { return }
            let month = Month(rawValue: action.title)
            self.chosenMonth = month
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
        if let salaryText = salaryTextField.text,
           let salary = Double(salaryText.replacingOccurrences(of: ",", with: ".")),
           salary != 0,
           let year = chosenYear,
           let month = chosenMonth {
            parameter = UserParameter(year: year, month: month, salary: salary)
        }
    }
    
    
    private func showAlert() {
        let alert = UIAlertController(
            title: "Недостаточно данных",
            message: "Пожалуйста, введите год, месяц и оклад",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension SalaryViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        textField.inputAccessoryView = toolbar
        
        let flexibleSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: textField,
            action: #selector(resignFirstResponder)
        )
        
        toolbar.items = [flexibleSpace, doneButton]
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
