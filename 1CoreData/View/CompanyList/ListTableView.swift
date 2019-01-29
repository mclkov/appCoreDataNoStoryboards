//
//  HomeLayoutTableView.swift
//  1CoreData
//
//  Created by McL on 1/15/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension CompanyList {
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
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: HomeConstants.cellReuseId)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let emptyCell = tableView.dequeueReusableCell(withIdentifier: HomeConstants.cellReuseId, for: indexPath)
        let cell = configureCell(emptyCell)
        let company = self.companies[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        
        var cellInfo = ""
        if let name = company.name, let founded = company.founded {
            let foundedDateString = dateFormatter.string(from: founded)
            cellInfo = "\(name), founded: \(foundedDateString)"
        }else{
            cellInfo = company.name ?? ""
        }
        
        cell.textLabel?.text = cellInfo
        cell.textLabel?.textColor = .white
        
        if let imageData = company.imageData {
            cell.imageView?.image = UIImage(data: imageData)
        }
        
        return cell
    }
    
    func configureCell(_ cell: UITableViewCell) -> UITableViewCell {
        return self.setupStylesOfCell(cell)
    }
    
    func setupStylesOfCell(_ cell: UITableViewCell) -> UITableViewCell {
        cell.backgroundColor = ColorScheme.teal
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
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return HomeConstants.heightOfCell
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
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.setTableFooterHeight()
    }
}
