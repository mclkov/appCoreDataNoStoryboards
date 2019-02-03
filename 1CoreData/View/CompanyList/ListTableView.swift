//
//  HomeLayoutTableView.swift
//  1CoreData
//
//  Created by McL on 1/15/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension CompanyListVC {
    func setupTableView() {
        self.setupTableViewStyles()
        self.fillFooterEmptySpace()
        self.registerCellReuseId()
    }
    
    func setupTableViewStyles() {
        tableView.backgroundColor = ColorScheme.darkBlue
        tableView.separatorColor = .white
    }
    
    func fillFooterEmptySpace() {
        self.tableView.tableFooterView = UIView()
    }
    
    func registerCellReuseId() {
        self.tableView.register(CompanyCell.self, forCellReuseIdentifier: HomeConstants.cellReuseId)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeConstants.cellReuseId, for: indexPath) as! CompanyCell
        let company = self.companies[indexPath.row]
        
        cell.configureCell(company: company)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.amountOfRowsForTableView()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.addExtraCellToBeginning()
    }
    
    func addExtraCellToBeginning() -> UIView {
        let view = UIView()
        view.backgroundColor = ColorScheme.lightBlue
        
        return view
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            self.removeCompanyBy(indexPath: indexPath)
        }
        deleteAction.backgroundColor = ColorScheme.lightRed
        
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (action, indexPath) in
            self.editCompanyBy(indexPath: indexPath)
        }
        editAction.backgroundColor = ColorScheme.darkBlue
        
        return [deleteAction, editAction]
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "No data available"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return HomeConstants.headerHeight
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return HomeConstants.cellHeight
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.setTableFooterHeight()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let company = companies[indexPath.row]
        self.presentViewEmployeeList(company: company)
    }
}
