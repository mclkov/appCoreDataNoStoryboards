//
//  ViewController.swift
//  1CoreData
//
//  Created by McL on 1/14/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

class HomeVC: UITableViewController {
    let colorScheme = ColorScheme()
    let constants = HomeConstants()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
    }
    
    @objc func addCompanyPressed() {
        print("Test")
    }
}

