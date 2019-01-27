//
//  UIViewControllerExt.swift
//  1CoreData
//
//  Created by McL on 1/19/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension AppDelegate {
    func setNavigationBarTheme () {
        self.setupBackground()
        self.setupTitleStyles()
        self.setupButtonColor()
    }
    
    func setupBackground() {
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = ColorScheme.lightRed
    }
    
    func setupTitleStyles() {
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func setupButtonColor() {
        UINavigationBar.appearance().tintColor = .white
    }
}
