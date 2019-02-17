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
    
    private func fetchEmployees() {
        guard let company = self.company else { return }
        guard let employees = company.employees?.allObjects as? [Employee] else { return }
        
        self.setSections(employees: employees)
    }
    
    func setSections(employees: [Employee]) {
        self.setShortNames(employees: employees)
        self.setLongNames(employees: employees)
    }
    
    func setShortNames(employees: [Employee]) {
        self.shortNameEmployees = employees.filter({ (employee) -> Bool in
            if let count = employee.name?.count {
                return self.conditionForShortNames(length: count)
            }
            return false
        })
    }
    
    func conditionForShortNames(length: Int) -> Bool {
        return length <= 6
    }
    
    func setLongNames(employees: [Employee]) {
        self.longNameEmployees = employees.filter({ (employee) -> Bool in
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
        var rows = 0
        if section == 0 {
            rows = self.shortNameEmployees.count
        } else if section == 1 {
           rows = self.longNameEmployees.count
        }
        
        return rows
    }
    
    func amountOfSectionsForTableView() -> Int {
        return 2
    }
}
