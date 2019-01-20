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
        self.setupBackgroundColor()
        self.setupBackgroundView()
        self.setupNavigationItem()
        self.setupNameLabel()
        self.setupNameTextField()
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
    
    func setupNavigationItem() {
        self.setupNavigationTitle()
        self.setupLeftBarButtonItemAndAction()
    }
    
    func setupNavigationTitle() {
        navigationItem.title = "Create company"
    }
    
    func setupLeftBarButtonItemAndAction() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancle", style: .plain, target: self, action: #selector(self.dismissByCancelPressed))
    }
    
    func setupNameLabel() {
        view.addSubview(nameLabel)
        nameLabel.backgroundColor = .yellow
        self.setupAnchorsOfNameLabel()
    }
    
    func setupAnchorsOfNameLabel() {
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupNameTextField() {
        view.addSubview(nameTextField)
        self.setupAnchorsOfNameTextField()
    }
    
    func setupAnchorsOfNameTextField() {
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor)
        
    }
}
