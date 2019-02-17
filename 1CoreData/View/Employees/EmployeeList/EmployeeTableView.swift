//
//  ListLayout.swift
//  1CoreData
//
//  Created by McL on 2/14/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension EmployeeListVC {
    func setupTableView() {
        self.registerCellReuseId()
        self.setupTableViewStyles()
    }
    
    func registerCellReuseId() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: EmployeesConstants.cellReuseId)
    }
    
    func setupTableViewStyles() {
        tableView.backgroundColor = ColorScheme.darkBlue
        tableView.separatorColor = .white
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.amountOfRowsForTableView(section: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmployeesConstants.cellReuseId, for: indexPath)
        let employee = self.getEmployeeBy(indexPath: indexPath)
        
        cell.textLabel?.textColor = .white
        cell.backgroundColor = ColorScheme.teal
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        
        var employeeDescription = employee.name ?? ""
        if let birthday = employee.employeeDetails?.birthday {
            employeeDescription = "\(employeeDescription), \(birthday)"
        }
        cell.textLabel?.text = employeeDescription
        
        return cell
    }
    
    func getEmployeeBy(indexPath: IndexPath) -> Employee {
        let section = indexPath.section
        let row = indexPath.row
        let employee = allEmployees[section][row]
        
        return employee
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.amountOfSectionsForTableView()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.addExtraCellToBeginningOfSection(section)
    }
    
    func addExtraCellToBeginningOfSection(_ section: Int) -> UIView {
        var headerText = ""
        if section == 0 {
            headerText = "Short names"
        } else {
            headerText = "Long names"
        }
        
        return self.getHeaderSectionLabel(text: headerText)
    }
    
    func getHeaderSectionLabel(text: String) -> UILabel {
        let label = IndentedLabel()
        label.textColor = ColorScheme.darkBlue
        label.backgroundColor = ColorScheme.lightBlue
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 16)
        
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return EmployeesConstants.headerHeight
    }
    
}
