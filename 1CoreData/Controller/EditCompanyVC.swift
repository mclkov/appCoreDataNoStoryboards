//
//  EditCompanyVC.swift
//  1CoreData
//
//  Created by McL on 1/25/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit
import CoreData

class EditCompanyVC: CompanyFactoryLayout, CompanyFactoryLayoutDelegate {
    var navigationBarActionFunctionsImplemented = true
    
    override func setupView() {
        super.setupView()
        self.setupLocalView()
    }
    
    @objc override func dismissByCancelPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc override func saveButtonPressed() {
        //
    }
}
