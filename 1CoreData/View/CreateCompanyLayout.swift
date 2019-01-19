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
        self.setupNavigationBar()
    }
    
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
