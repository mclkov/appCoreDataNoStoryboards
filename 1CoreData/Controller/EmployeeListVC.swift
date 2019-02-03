//
//  EmployeeListVC.swift
//  1CoreData
//
//  Created by McL on 2/3/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

class EmployeeListVC: UITableViewController {
    func setTitle(company: Company) {
        self.navigationItem.title = company.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = ColorScheme.darkBlue
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(self.addEmployeePressed))
    }
    
    @objc func addEmployeePressed() {
        print("Add employee")
    }
}
