//
//  CreateCompanyLayout.swift
//  1CoreData
//
//  Created by McL on 1/19/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension EditCompanyVC {
    func setupLocalView() {
        self.setupNavigationItem(title: "Edit Company")
    }
    
    func setupCompanyNameTextField(name: String) {
        self.nameTextField.text = name
    }
}
