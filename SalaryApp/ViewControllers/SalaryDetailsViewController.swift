//
//  EasyCountDetailsViewController.swift
//  SalaryApp
//
//  Created by Варвара Уткина on 13.03.2024.
//

import UIKit

final class SalaryDetailsViewController: UIViewController {
    @IBOutlet var yearLabel: UILabel!
    
    var parameter: UserParameter!
    
    private var networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yearLabel.text = "Год: \(parameter.year.formatted())"
//        networkManager.fetchCalednar(Link(rawValue: parameter.year.formatted())!) { result in
//            switch result {
//            case .success(let calendar):
//                print(calendar)
//            case .failure(let error):
//                print(error)
//            }
//        }
    }

    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
}
