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
        self.setupCompanyNameTextField()
    }
    
    func setupCompanyNameTextField() {
        if let name = self.company?.name {
            self.nameTextField.text = name
        }

        if let founded = self.company?.founded {
            self.datePicker.setDate(founded, animated: false)
        }
    }
}
