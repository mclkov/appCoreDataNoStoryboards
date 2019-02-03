//
//  UIViewController+NavBarButtons.swift
//  1CoreData
//
//  Created by McL on 2/3/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension UIViewController {
    func setupRightButtonInNavigationBar(selector: Selector) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: selector)
    }
}
