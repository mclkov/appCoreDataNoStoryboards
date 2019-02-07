//
//  ViewController.swift
//  1CoreData
//
//  Created by McL on 1/14/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit
import CoreData

class CompanyListVC: UITableViewController {
    var companies = [Company]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchCompanies()
        self.setupView()
        self.setupTableView()
    }
    
    func amountOfRowsForTableView() -> Int {
        return companies.count
    }
    
    @objc func resetPressed() {
        CoreDataManager.shared.resetCompanies()
        self.deleteCompaniesFromUIWithAnimation()
    }
    
    private func deleteCompaniesFromUI() {
        companies.removeAll()
        tableView.reloadData()
    }
    
    private func deleteCompaniesFromUIWithAnimation() {
        let indexPathsToRemove = self.getIndexPathsArray()
        companies.removeAll()
        tableView.deleteRows(at: indexPathsToRemove, with: .left)
    }
    
    func getIndexPathsArray() -> [IndexPath] {
        var resultIndexPaths = [IndexPath]()
        for (index, _) in companies.enumerated() {
            let indexPath = IndexPath(row: index, section: 0)
            resultIndexPaths.append(indexPath)
        }
        
        return resultIndexPaths
    }
    
    @objc func addCompanyPressed() {
        self.presentViewCreateCompany()
    }
    
    private func presentViewCreateCompany() {
        let createCompanyController = CreateCompanyVC()
        createCompanyController.delegate = self // to pass the function didAddCompany
        createCompanyController.setupNavigationTitle("Create Company")
        
        let navigationController = CustomNavigationController(rootViewController: createCompanyController)
        
        present(navigationController, animated: true, completion: nil)
    }
    
    private func fetchCompanies() {
        self.companies = CoreDataManager.shared.fetchCompanies()
        self.tableView.reloadData()
    }
    
    func removeCompanyBy(indexPath: IndexPath) {
        let company = self.companies[indexPath.row]
        CoreDataManager.shared.removeCompany(company)
        self.removeCompanyFromUI(indexPath)
    }
    
    private func removeCompanyFromUI(_ indexPath: IndexPath) {
        companies.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func editCompany(_ company: Company) {
        self.presentViewEditCompany(company)
    }
    
    private func presentViewEditCompany(_ company: Company) {
        let editCompanyController = EditCompanyVC()
        editCompanyController.company = company
        editCompanyController.delegate = self
        
        let navigationController = CustomNavigationController(rootViewController: editCompanyController)
    
        present(navigationController, animated: true, completion: nil)
    }
    
    func setTableFooterHeight() -> CGFloat {
        if self.showTableFooterIfCompanyListIsEmpty() {
            return HomeConstants.footerHeight
        } else {
            return 0.0
        }
    }
    
    private func showTableFooterIfCompanyListIsEmpty() -> Bool {
        if companies.count == 0 {
            return true
        }
        return false
    }
    
    func presentViewEmployeeList(company: Company) {
        let employeeController = EmployeeListVC()
        employeeController.setTitle(company: company)
        navigationController?.pushViewController(employeeController, animated: true)
    }
}

