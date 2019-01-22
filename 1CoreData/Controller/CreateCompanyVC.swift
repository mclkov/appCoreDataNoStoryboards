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
        self.saveCompanyAndAnimateTableUpdate()
    }
    
    
    // there is a catch with context inside dismissing - animateTableViewAddingNew() :
    // after 'try context.save()' executes the rest of the function, except dismiss(closure)
    // in fact, code in the closure is called after dismissal is fully complete; at that time `context` does not exist
    func saveCompanyAndAnimateTableUpdate() {
        guard let name = nameTextField.text else { return }
//        let persistentContainer = NSPersistentContainer(name: "DataModel")
//        persistentContainer.loadPersistentStores { (storeDescritpion, error) in
//            if let error = error {
//                fatalError("Loading of store failed \(error)")
//            }
//        }
//        let context = persistentContainer.viewContext
        
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let companyManagedObject = NSEntityDescription.insertNewObject(forEntityName: "Company", into: context)
        companyManagedObject.setValue(name, forKey: "name")
        
        do {
            try context.save()
            self.addWithAnimation(companyManagedObject)
        } catch let saveError {
            print("Failed to save company:", saveError)
        }
    }
    
    func addWithAnimation(_ companyManagedObject: NSManagedObject) {
        guard let company = companyManagedObject as? Company else { return }
        dismiss(animated: true) {
            self.delegate?.didAddCompany(company: company)
        }
    }
}
