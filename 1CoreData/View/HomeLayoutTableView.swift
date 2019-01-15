//
//  HomeLayoutTableView.swift
//  1CoreData
//
//  Created by McL on 1/15/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension HomeVC {
    func setupTableView() {
        self.fillFooterEmptySpace()
        self.registerCellReuseId()
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
        self.calculateRows()
    }
    
    func calculateRows() -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        self.addExtraCellToBeginning()
    }
    
    func addExtraCellToBeginning() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }
}
