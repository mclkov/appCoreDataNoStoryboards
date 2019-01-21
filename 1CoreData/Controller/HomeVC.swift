//
//  ViewController.swift
//  1CoreData
//
//  Created by McL on 1/14/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

class CompanyList: UITableViewController, CreateCompanyControllerDelegate {
    var companies = [Company]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
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
}

