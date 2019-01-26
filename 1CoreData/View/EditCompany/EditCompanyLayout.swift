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
        guard let name = self.company?.name else { return }
        guard let founded = self.company?.founded else { return }
        
        self.nameTextField.text = name
        self.datePicker.setDate(founded, animated: false)
    }
}
