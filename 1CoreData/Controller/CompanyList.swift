//
//  ViewController.swift
//  1CoreData
//
//  Created by McL on 1/14/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit
import CoreData

class CompanyList: UITableViewController, CreateCompanyControllerDelegate {
    var companies = [Company]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchCompanies()
        self.setupView()
        self.setupTableView()
    }
    
    func didAddCompany(company: Company) {
        self.companies.append(company)
        let nextIndexValue = companies.count - 1
        let newIndexPath = IndexPath(row: nextIndexValue, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
    
    func amountOfRowsForTableView() -> Int {
        return companies.count
    }
    
    @objc func addCompanyPressed() {
        let createCompanyController = CreateCompanyVC()
        let navigationController = CustomNavigationController(rootViewController: createCompanyController)
        createCompanyController.delegate = self // to pass the function didAddCompany
        
        present(navigationController, animated: true, completion: nil)
    }
    
    func fetchCompanies() {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        // let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Company") // the next line does the same, but is more specific "<Company>"
        let fetchRequest = NSFetchRequest<Company>(entityName: "Company")
        
        do {
            let resultFetch = try context.fetch(fetchRequest)            
            self.updateTableViewOfCompanies(companiesArray: resultFetch)
        } catch let fetchError {
            print("Failed to fetch companies:", fetchError)
        }
    }
    
    func updateTableViewOfCompanies(companiesArray: [Company]) {
        self.companies = companiesArray
        self.tableView.reloadData()
    }
}

