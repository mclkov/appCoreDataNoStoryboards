//
//  ViewController.swift
//  1CoreData
//
//  Created by McL on 1/14/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit
import CoreData

protocol CompanyDataDelegate {
    func didAddCompany(company: Company)
    func didEditCompany(company: Company)
}

class CompanyList: UITableViewController {
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
        self.deleteCompaniesFromCoreDataAndUI()
    }
    
    private func deleteCompaniesFromCoreDataAndUI() {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: Company.fetchRequest())
        
        do {
            try context.execute(batchDeleteRequest)
            self.deleteCompaniesFromUIWithAnimation()
        } catch let deleteError {
            print("Failed to delete objects from CoreData:", deleteError)
        }
    }
    
    private func deleteCompaniesFromUI() {
        companies.removeAll()
        tableView.reloadData()
    }
    
    private func deleteCompaniesFromUIWithAnimation() {
        var indexPathsToRemove = [IndexPath]()
        for (index, _) in companies.enumerated() {
            let indexPath = IndexPath(row: index, section: 0)
            indexPathsToRemove.append(indexPath)
        }
        companies.removeAll()
        tableView.deleteRows(at: indexPathsToRemove, with: .left)
    }
    
    @objc func addCompanyPressed() {
        self.presentViewCreateCompany()
    }
    
    private func presentViewCreateCompany() {
        let createCompanyController = CreateCompanyVC()
        createCompanyController.delegate = self // to pass the function didAddCompany
        createCompanyController.setupNavigationItem(title: "Create Company")
        
        let navigationController = CustomNavigationController(rootViewController: createCompanyController)
        
        present(navigationController, animated: true, completion: nil)
    }
    
    private func fetchCompanies() {
        self.companies = CoreDataManager.shared.fetchCompanies()
        self.tableView.reloadData()
    }
    
    func removeCompanyBy(indexPath: IndexPath) {
        self.removeCompanyFromCoreDataAndUI(indexPath);
    }
    
    private func removeCompanyFromCoreDataAndUI(_ indexPath: IndexPath) {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let company = self.companies[indexPath.row]
        context.delete(company)
        
        do {
            try context.save()
            self.removeCompanyFromUI(indexPath)
        } catch let saveError {
            print("Failed to delete company", saveError)
        }
    }
    
    private func removeCompanyFromUI(_ indexPath: IndexPath) {
        companies.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func editCompanyBy(indexPath: IndexPath) {
        let company = companies[indexPath.row]
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
}

