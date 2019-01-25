//
//  CreateCompanyLayout.swift
//  1CoreData
//
//  Created by McL on 1/19/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension CreateCompanyVC {
    func setupView() {
        self.setupRightBarButtonItemAndAction()
        self.setupBackgroundColor()
        self.setupBackgroundView()
        self.setupNameLabel()
        self.setupNameTextField()
    }
    
    func setupRightBarButtonItemAndAction() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(self.saveButtonPressed))
    }
    
    func setupBackgroundColor() {
        view.backgroundColor = ColorScheme.darkBlue
    }
    
    func setupBackgroundView() {
        let backgroundView = UIView()
        backgroundView.backgroundColor = ColorScheme.lightBlue
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        self.setupAnchorsOfBackgroundView(reference: backgroundView)
    }
    
    func setupAnchorsOfBackgroundView(reference: UIView) {
        reference.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        reference.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        reference.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        reference.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupNavigationItem(title: String) {
        self.setupNavigationTitle(title)
        self.setupLeftBarButtonItemAndAction()
    }
    
    func setupNavigationTitle(_ title: String) {
        navigationItem.title = title
    }
    
    func setupLeftBarButtonItemAndAction() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancle", style: .plain, target: self, action: #selector(self.dismissByCancelPressed))
    }
    
    func setupNameLabel() {
        view.addSubview(nameLabel)
        self.setupNameLabelAnchors()
    }
    
    func setupNameLabelAnchors() {
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupNameTextField() {
        view.addSubview(nameTextField)
        self.setupNameTextFieldAnchors()
    }
    
    func setupNameTextFieldAnchors() {
        nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
    }
}
