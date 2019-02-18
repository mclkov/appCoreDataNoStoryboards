//
//  CreateEmployeeLayout.swift
//  1CoreData
//
//  Created by McL on 2/7/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension CreateEmployeeVC {
    func setupView() {
        self.setupNavigationItem()
        self.setupBackgroundColor()
        self.setupBackgroundView()
        
        self.setupNameLabel()
        self.setupNameTextField()
        self.setupBirthdayLabel()
        self.setupBirthdayTextField()
        self.setupEmployeeTypeSegmentedControl()
    }
    
    func setupNavigationItem() {
        self.setupNavigationTitle("Create Employee")
        self.setupLeftButtonInNavigationBar(title: "Cancel", selector: #selector(self.dismissByCancelPressed))
        self.setupRightButtonInNavigationBar(title: "Save", selector: #selector(self.saveButtonPressed))
    }
    
    func setupBackgroundColor() {
        view.backgroundColor = ColorScheme.darkBlue
    }
    
    private func setupBackgroundView() {
        view.addSubview(backgroundView)
        self.setupBackgroundViewAnchors()
    }
    
    private func setupBackgroundViewAnchors() {
        let amountOfFields: CGFloat = 3
        
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundView.heightAnchor.constraint(equalToConstant: 50 * amountOfFields).isActive = true
    }
    
    private func setupNameLabel() {
        view.addSubview(nameLabel)
        self.setupNameLabelAnchors()
    }
    
    private func setupNameLabelAnchors() {
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupNameTextField() {
        view.addSubview(nameTextField)
        self.setupNameTextFieldAnchors()
    }
    
    private func setupNameTextFieldAnchors() {
        nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
    }
    
    private func setupBirthdayLabel() {
        view.addSubview(birthdayLabel)
        self.setupBirthdayLabelAnchors()
    }
    
    private func setupBirthdayLabelAnchors() {
        birthdayLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        birthdayLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        birthdayLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor).isActive = true
        birthdayLabel.heightAnchor.constraint(equalTo: nameLabel.heightAnchor).isActive = true
    }
    
    private func setupBirthdayTextField() {
        view.addSubview(birthdayTextField)
        self.setupBirthdayTextFieldAnchors()
    }
    
    private func setupBirthdayTextFieldAnchors() {
        birthdayTextField.topAnchor.constraint(equalTo: birthdayLabel.topAnchor).isActive = true
        birthdayTextField.leftAnchor.constraint(equalTo: birthdayLabel.rightAnchor).isActive = true
        birthdayTextField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        birthdayTextField.bottomAnchor.constraint(equalTo: birthdayLabel.bottomAnchor).isActive = true
    }
    
    private func setupEmployeeTypeSegmentedControl() {
        view.addSubview(employeeTypeSegmentedControl)
        self.setupEmployeeTypeSegmentedControlAnchors()
    }
    
    private func setupEmployeeTypeSegmentedControlAnchors() {
        employeeTypeSegmentedControl.topAnchor.constraint(equalTo: birthdayLabel.bottomAnchor).isActive = true
        employeeTypeSegmentedControl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        employeeTypeSegmentedControl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        employeeTypeSegmentedControl.heightAnchor.constraint(equalToConstant: 34).isActive = true
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertActionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(alertActionOk)
        
        present(alertController, animated: true, completion: nil)
    }
}
