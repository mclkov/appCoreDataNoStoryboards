//
//  CreateCompanyController.swift
//  1CoreData
//
//  Created by McL on 1/19/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

class CreateCompanyVC: UIViewController {
    var homeController: HomeVC?
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Enter name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    @objc func dismissByCancelPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func saveButtonPressed() {
        dismiss(animated: true) {
            self.saveCompanyActionAndAnimation()
        }
    }
    
    func saveCompanyActionAndAnimation() {
        guard let name = nameTextField.text else { return }
        let company = Company(name: name, founded: Date())
        homeController?.addCompany(company: company)
    }
}
