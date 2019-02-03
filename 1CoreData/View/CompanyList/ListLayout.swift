//
//  HomeView.swift
//  1CoreData
//
//  Created by McL on 1/14/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension CompanyListVC {
    func setupView() {
        self.setupNavigationItem()
    }
    
    func setupNavigationItem() {
        self.setupNavigationTitle("Test")
        self.setupRightBarButtonItemAndAction()
        self.setupLeftBarButtonItemAndAction()
        self.setupColorOfRightBarButton()
    }

    func setupNavigationTitle(_ title: String) {
        self.navigationItem.title = title
    }
    
    func setupRightBarButtonItemAndAction() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(self.addCompanyPressed))
    }
    
    func setupLeftBarButtonItemAndAction() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Reset table", style: .plain, target: self, action: #selector(self.resetPressed))
    }
    
    func setupColorOfRightBarButton() {
        self.navigationItem.rightBarButtonItem?.tintColor = .white
    }
}

