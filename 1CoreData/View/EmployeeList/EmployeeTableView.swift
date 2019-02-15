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
        return self.amountOfRowsForTableView()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmployeesConstants.cellReuseId, for: indexPath)
        
        let employee = employees[indexPath.row]
        cell.textLabel?.text = employee.name
        cell.textLabel?.textColor = .white
        cell.backgroundColor = ColorScheme.teal
//        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        
        return cell
    }
    
}
