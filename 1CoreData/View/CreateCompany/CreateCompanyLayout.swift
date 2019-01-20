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
        self.setupBackgroundView()
        self.setupNavigationItem()
        self.setupNameLabel()
    }
    
    func setupBackgroundView()
    {
        let backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = ColorScheme.lightBlue
        view.addSubview(backgroundView)
        self.setupAnchorsToBoundaries(element: backgroundView)
    }
    
    func setupAnchorsToBoundaries(element: UIView) {
        element.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        element.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        element.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        element.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
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
        self.setupAnchorsOfNameLabel()
    }
    
    func setupAnchorsOfNameLabel() {
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
