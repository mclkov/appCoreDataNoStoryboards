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
        self.setupRightButtonInNavigationBar(title: "Add", selector: #selector(self.addCompanyPressed))
        self.setupLeftButtonInNavigationBar(title: "Reset table", selector: #selector(self.resetPressed))
    }

    func setupNavigationTitle(_ title: String) {
        self.navigationItem.title = title
    }
    
    func setupColorOfRightBarButton() {
        self.navigationItem.rightBarButtonItem?.tintColor = .white
    }
}

