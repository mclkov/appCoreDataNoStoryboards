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
    var company: Company?
    
    var allEmployees = [[Employee]]()
    var employeeTypes = [
        EmployeeType.Executive.description,
        EmployeeType.SeniorManagement.description,
        EmployeeType.Staff.description
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupRightButtonInNavigationBar(title: "Add", selector: #selector(self.addEmployeePressed))
        self.setupView()
        self.setupTableView()
        self.fetchEmployees()
    }
    
    @objc func addEmployeePressed() {
        let createEmployeeController = CreateEmployeeVC()
        let navigationController = CustomNavigationController(rootViewController: createEmployeeController)
        createEmployeeController.delegate = self
        createEmployeeController.company = self.company
        present(navigationController, animated: true, completion: nil)
    }
    
    func fetchEmployees() {
        guard let company = self.company else { return }
        guard let employees = company.employees?.allObjects as? [Employee] else { return }
        
        self.setSections(employees: employees)
    }
    
    func setSections(employees: [Employee]) {
        employeeTypes.forEach { (employeeType) in
            let filtratedEmployees = employees.filter { $0.type == employeeType.description}
            self.allEmployees.append(filtratedEmployees)
        }
    }
    
    func amountOfRowsForTableView(section: Int) -> Int {
        return allEmployees[section].count
    }
    
    func amountOfSectionsForTableView() -> Int {
        return allEmployees.count
    }
}
