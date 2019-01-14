//
//  HomeView.swift
//  1CoreData
//
//  Created by McL on 1/14/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension ViewController {
    func setupView() {
        view.backgroundColor = .white
        self.setupNavigationItem()
        self.setupNavigationBar()
    }
    
    func setupNavigationItem() {
        self.setupNavigationTitle("Test")
        self.setupRightBarButtonItemAndAction()
    }
    
    // { setupNavigationItem
    func setupNavigationTitle(_ title: String) {
        self.navigationItem.title = title
    }
    
    func setupRightBarButtonItemAndAction() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(self.addCompanyPressed))
    }
    // setupNavigationItem }
    
    func setupNavigationBar() {
        let navigationBar = navigationController!.navigationBar
        
        self.setupBackgroundOfNavigationBar(navigationBar)
        self.setupTranslucentOfNavigationBar(navigationBar)
        self.setupTitleOfNavigationBar(navigationBar)
        
    }
    
    // { setupNavigationBar
    func setupBackgroundOfNavigationBar(_ navigationBarReference: UINavigationBar) {
        navigationBarReference.backgroundColor = .yellow
    }
    
    func setupTranslucentOfNavigationBar(_ navigationBarReference: UINavigationBar) {
        navigationBarReference.isTranslucent = false
    }
    
    func setupTitleOfNavigationBar(_ navigationBarReference: UINavigationBar) {
        navigationBarReference.barTintColor = ColorScheme().lightRed
        navigationBarReference.prefersLargeTitles = true
        navigationBarReference.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    // setupNavigationBar }
}

