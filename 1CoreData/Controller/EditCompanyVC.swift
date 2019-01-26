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
    var company: Company?
    var delegate: CompanyDataDelegate?
    
    override func setupView() {
        super.setupView()
        self.setupLocalView()
    }
    
    @objc override func dismissByCancelPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc override func saveButtonPressed() {
        guard let name = nameTextField.text else { return }
        guard let company = self.company else { return }
        
        let context = CoreDataManager.shared.persistentContainer.viewContext
        self.company?.name = name
        self.company?.founded = datePicker.date
        
        do {
            try context.save()
            self.updateWithAnimation(company)
        } catch let saveError {
            print("Failed to save company:", saveError)
        }
    }
    
    func updateWithAnimation(_ company: Company) {
        dismiss(animated: true, completion: {
            self.delegate?.didEditCompany(company: self.company!)
        })
    }
}
