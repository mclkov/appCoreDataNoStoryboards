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
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundView.heightAnchor.constraint(equalToConstant: 100).isActive = true
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
}
