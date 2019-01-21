//
//  CreateCompanyController.swift
//  1CoreData
//
//  Created by McL on 1/19/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit
import CoreData

protocol CreateCompanyControllerDelegate {
    func didAddCompany(company: Company)
}

class CreateCompanyVC: UIViewController {
    var delegate: CreateCompanyControllerDelegate?
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Enter name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    @objc func dismissByCancelPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func saveButtonPressed() {
        dismiss(animated: true) {
            self.saveCompanyAndAnimateTableUpdate()
        }
    }
    
    func saveCompanyAndAnimateTableUpdate() {
        guard let name = nameTextField.text else { return }
        
        let persistentContainer = NSPersistentContainer(name: "DataModel")
        persistentContainer.loadPersistentStores { (storeDescritpion, error) in
            if let error = error {
                fatalError("Loading of store failed \(error)")
            }
        }
        let context = persistentContainer.viewContext
        let company = NSEntityDescription.insertNewObject(forEntityName: "Company", into: context)
        
        company.setValue(name, forKey: "name")
        
        do {
            try context.save()
        } catch let saveError {
            print("Failed to save company:", saveError)
        }
        
//        let company = Company(name: name, founded: Date())
//        self.delegate?.didAddCompany(company: company)
    }
}
