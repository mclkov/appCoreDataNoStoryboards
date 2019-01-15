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
        self.setupFooterView()
        self.registerCellReuseId()
    }
    
    func setupFooterView() {
        self.tableView.tableFooterView = UIView()
    }
    
    func registerCellReuseId() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.constants.cellReuseId)
    }
}
