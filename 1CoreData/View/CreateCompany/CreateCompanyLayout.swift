//
//  CreateCompanyLayout.swift
//  1CoreData
//
//  Created by McL on 1/19/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension CreateCompanyVC {
    func setupLocalView() {
        self.setupNavigationItem(title: "Create Company")
        self.setupRightButtonInNavigationBar(title: "Save", selector: #selector(self.saveButtonPressed))
        self.setupLeftButtonInNavigationBar(title: "Cancel", selector: #selector(self.dismissByCancelPressed))
    }
}
