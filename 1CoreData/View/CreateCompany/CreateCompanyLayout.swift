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
}
