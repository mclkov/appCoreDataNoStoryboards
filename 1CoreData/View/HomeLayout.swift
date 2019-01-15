//
//  HomeView.swift
//  1CoreData
//
//  Created by McL on 1/14/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension HomeVC {
    func setupView() {
        self.setupTableViewStyles()
        self.setupNavigationItem()
        self.setupNavigationBar()
    }
    
    func setupTableViewStyles() {
        tableView.backgroundColor = ColorScheme.darkBlue
        tableView.separatorStyle = .none
    }
    
    func setupNavigationItem() {
        self.setupNavigationTitle("Test")
        self.setupRightBarButtonItemAndAction()
        self.setupColorOfRightBarButton()
    }
    
    // { setupNavigationItem
    func setupNavigationTitle(_ title: String) {
        self.navigationItem.title = title
    }
    
    func setupRightBarButtonItemAndAction() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(self.addCompanyPressed))
    }
    
    func setupColorOfRightBarButton() {
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
    }
    // setupNavigationItem }
    
    func setupNavigationBar() {
        let navigationBar = navigationController!.navigationBar
        navigationBar.backgroundColor = .yellow
        navigationBar.isTranslucent = false
        
        self.setupTitleStylesOfNavigationBar(navigationBar)
    }
    
    func setupTitleStylesOfNavigationBar(_ navigationBarReference: UINavigationBar) {
        navigationBarReference.barTintColor = ColorScheme.lightRed
        navigationBarReference.prefersLargeTitles = true
        navigationBarReference.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationBarReference.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}

