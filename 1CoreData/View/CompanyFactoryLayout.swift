//
//  CreateCompanyLayout.swift
//  1CoreData
//
//  Created by McL on 1/19/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

protocol CompanyFactoryLayoutDelegate {
    var navigationBarActionFunctionsImplemented: Bool { get }
    func dismissByCancelPressed()
    func saveButtonPressed()
}

class CompanyFactoryLayout: UIViewController {
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
    
    let datePicker: UIDatePicker = {
       let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    func setupNavigationItem(title: String) {
        self.navigationItem.title = title
    }
    
    func setupView() {
        self.setupLeftBarButtonItemAndAction()
        self.setupRightBarButtonItemAndAction()
        self.setupBackgroundColor()
        self.setupBackgroundView()
        self.setupNameLabel()
        self.setupNameTextField()
        self.setupDataPicker()
    }
    
    private func setupLeftBarButtonItemAndAction() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancle", style: .plain, target: self, action: #selector(self.dismissByCancelPressed))
    }
    
    @objc func dismissByCancelPressed() {
        //
    }
    
    private func setupRightBarButtonItemAndAction() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(self.saveButtonPressed))
    }
    
    @objc func saveButtonPressed() {
        //
    }
    
    private func setupBackgroundColor() {
        view.backgroundColor = ColorScheme.darkBlue
    }
    
    private func setupBackgroundView() {
        view.addSubview(backgroundView)
        self.setupAnchorsOfBackgroundView()
    }
    
    private func setupAnchorsOfBackgroundView() {
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundView.heightAnchor.constraint(equalToConstant: 250).isActive = true
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
    
    private func setupDataPicker() {
        view.addSubview(datePicker)
        self.setupDataPickerAnchors()
        self.setupDatePickerFormat()
    }
    
    private func setupDataPickerAnchors() {
        datePicker.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        datePicker.leftAnchor.constraint(equalTo: backgroundView.leftAnchor).isActive = true
        datePicker.rightAnchor.constraint(equalTo: backgroundView.rightAnchor).isActive = true
        datePicker.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor).isActive = true
    }
    
    private func setupDatePickerFormat() {
        datePicker.datePickerMode = .date
    }
}
