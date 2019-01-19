//
//  ViewController.swift
//  1CoreData
//
//  Created by McL on 1/14/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

class HomeVC: UITableViewController {
    let companies = [
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
    
    @objc func addCompanyPressed() {
        let createCompanyController = CreateCompanyVC()
        let navigationController = UINavigationController(rootViewController: createCompanyController)
        
        present(navigationController, animated: true, completion: nil)
    }
}

