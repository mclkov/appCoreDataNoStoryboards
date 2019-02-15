//
//  CompanyListVC+CreateCompany.swift
//  1CoreData
//
//  Created by McL on 2/1/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

protocol CompanyDataDelegate {
    func didAddCompany(company: Company)
    func didEditCompany(company: Company)
}

extension CompanyListVC: CompanyDataDelegate  {
    func didEditCompany(company: Company) {
        let row = self.companies.index(of: company)
        let indexPath = IndexPath(row: row!, section: 0)
        
        tableView.reloadRows(at: [indexPath], with: .middle)
    }
    
    func didAddCompany(company: Company) {
        self.companies.append(company)
        let nextIndexValue = companies.count - 1
        let newIndexPath = IndexPath(row: nextIndexValue, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
}
