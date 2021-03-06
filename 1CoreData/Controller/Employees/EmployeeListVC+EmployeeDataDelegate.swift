//
//  EmployeeListVC+EmployeeDataDelegate.swift
//  1CoreData
//
//  Created by McL on 2/14/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

protocol EmployeeDataDelegate {
    func didAddEmployee(employee: Employee)
}

extension EmployeeListVC: EmployeeDataDelegate{
    func didAddEmployee(employee: Employee) {
        self.fetchEmployees()
        self.tableView.reloadData()
        
        //        TODO: add with animation using sections
//        self.employees.append(employee)
//        let nextIndexValue = employees.count - 1
//        let newIndexPath = IndexPath(row: nextIndexValue, section: 0)
//        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
}
