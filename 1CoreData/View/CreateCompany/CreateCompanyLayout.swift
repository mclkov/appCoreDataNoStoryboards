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
        self.setupLeftBarButtonItemAndAction()
        self.setupRightBarButtonItemAndAction()
    }
    func setupLeftBarButtonItemAndAction() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancle", style: .plain, target: self, action: #selector(self.dismissByCancelPressed))
    }
    
    func setupRightBarButtonItemAndAction() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(self.saveButtonPressed))
    }
}
