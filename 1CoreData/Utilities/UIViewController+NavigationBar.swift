//
//  UIViewController+NavBarButtons.swift
//  1CoreData
//
//  Created by McL on 2/3/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension UIViewController {
    func setupNavigationTitle(_ title: String) {
        self.navigationItem.title = title
    }
    
    func setupRightButtonInNavigationBar(title: String, selector: Selector) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: selector)
    }
    
    func setupLeftButtonInNavigationBar(title: String, selector: Selector) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: selector)
    }
}
