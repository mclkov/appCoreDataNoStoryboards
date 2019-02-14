//
//  EmployeeListVC.swift
//  1CoreData
//
//  Created by McL on 2/3/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit
import CoreData

class EmployeeListVC: UITableViewController {
    var employees = [Employee]()
    func setTitle(company: Company) {
        self.navigationItem.title = company.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = ColorScheme.darkBlue
        
        self.setupRightButtonInNavigationBar(title: "Add", selector: #selector(self.addEmployeePressed))
        
        self.setupTableView()
        self.fetchEmployees()
    }
    
    @objc func addEmployeePressed() {
        let createEmployeeController = CreateEmployeeVC()
        let navigationController = CustomNavigationController(rootViewController: createEmployeeController)
        
        present(navigationController, animated: true, completion: nil)
    }
    
    private func fetchEmployees() {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let request = NSFetchRequest<Employee>(entityName: "Employee")
        
        do {
            let employees = try context.fetch(request)            
            self.employees = employees
        } catch let error {
            print("Failed to fetch employees:", error)
        }
    }
    
    func amountOfRowsForTableView() -> Int {
        return employees.count
    }
}
