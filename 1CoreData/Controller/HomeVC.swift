//
//  ViewController.swift
//  1CoreData
//
//  Created by McL on 1/14/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

class HomeVC: UITableViewController {
    var companies = [
        Company(name: "Apple", founded: Date()),
        Company(name: "SpaceX", founded: Date())
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
    }
    
    func amountOfRowsForTableView() -> Int {
        return companies.count
    }
    
    func addCompany(company: Company) {
        self.companies.append(company)
        let nextIndexValue = companies.count - 1
        let newIndexPath = IndexPath(row: nextIndexValue, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
    
    @objc func addCompanyPressed() {
        let createCompanyController = CreateCompanyVC()
        let navigationController = CustomNavigationController(rootViewController: createCompanyController)
        
        // link between controllers
        createCompanyController.homeController = self
        
        present(navigationController, animated: true, completion: nil)
    }
}

