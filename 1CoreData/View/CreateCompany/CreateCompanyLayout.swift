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
        self.setupNavigationItem()
        
        self.setupNameLabel()
    }
    
    func setupBackgroundColor() {
        view.backgroundColor = .yellow
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
        self.setupAnchorOfNameLabel()
    }
    
    func setupAnchorOfNameLabel() {
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
