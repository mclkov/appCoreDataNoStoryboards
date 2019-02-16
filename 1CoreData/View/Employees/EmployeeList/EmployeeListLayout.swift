//
//  EmployeeListLayout.swift
//  1CoreData
//
//  Created by McL on 2/15/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension EmployeeListVC {
    func setupView() {
        self.setTitle()
    }
    
    func setTitle() {
        guard let company = self.company else { return }
        self.navigationItem.title = company.name
    }
}
