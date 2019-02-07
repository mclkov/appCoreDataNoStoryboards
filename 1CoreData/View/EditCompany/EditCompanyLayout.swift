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
        self.setupRightButtonInNavigationBar(title: "Save", selector: #selector(self.saveButtonPressed))
        self.setupLeftButtonInNavigationBar(title: "Cancel", selector: #selector(self.dismissByCancelPressed))
        self.showCurrentPropertiesInUI()
    }
    
    func showCurrentPropertiesInUI() {
        guard let name = self.company?.name else { return }
        guard let founded = self.company?.founded else { return }
        
        self.nameTextField.text = name
        self.datePicker.setDate(founded, animated: false)
        
        if let imageData = self.company?.imageData {
            self.companyImageView.image = UIImage(data: imageData)
        }
    }
}
