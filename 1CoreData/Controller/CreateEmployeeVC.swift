//
//  CreateEmployeeVC.swift
//  1CoreData
//
//  Created by McL on 2/3/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

class CreateEmployeeVC: UIViewController {
    var delegate: EmployeeDataDelegate?
    
    let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = ColorScheme.lightBlue
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundView
    }()
    
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
        self.saveEmployeeAndUpdateTableView()
    }
    
    func saveEmployeeAndUpdateTableView() {
        guard let employeeName = nameTextField.text else { return }
        let coreDataResult = CoreDataManager.shared.createEmployee(employeeName: employeeName)
        let employee = coreDataResult.0
        let error = coreDataResult.1
        
        if let error = error {
            //TODO: present error
            print(error)
        } else {
            self.addWithAnimation(employee!)
        }
    }
    
    func addWithAnimation(_ employee: Employee) {
        dismiss(animated: true) {
            self.delegate?.didAddEmployee(employee: employee)
        }
    }
}
