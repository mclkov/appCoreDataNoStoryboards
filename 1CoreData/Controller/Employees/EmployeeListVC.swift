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
    var shortNameEmployees = [Employee]()
    var longNameEmployees = [Employee]()
    
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
        self.allEmployees = [
            self.getShortNameEmployees(employees: employees),
            self.getLongNameEmployees(employees: employees)
        ]
    }
    
    func getShortNameEmployees(employees: [Employee]) -> [Employee] {
        return employees.filter({ (employee) -> Bool in
            if let count = employee.name?.count {
                return self.conditionForShortNames(length: count)
            }
            return false
        })
    }
    
    func conditionForShortNames(length: Int) -> Bool {
        return length <= 6
    }
    
    func getLongNameEmployees(employees: [Employee]) -> [Employee] {
        return employees.filter({ (employee) -> Bool in
            if let count = employee.name?.count {
                return self.conditionForLongNames(length: count)
            }
            return false
        })
    }
    
    func conditionForLongNames(length: Int) -> Bool {
        return length > 6
    }
    
    func amountOfRowsForTableView(section: Int) -> Int {
        return allEmployees[section].count
    }
    
    func amountOfSectionsForTableView() -> Int {
        return allEmployees.count
    }
}
