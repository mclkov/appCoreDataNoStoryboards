//
//  ViewController.swift
//  1CoreData
//
//  Created by McL on 1/14/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit
import CoreData

class CompanyList: UITableViewController, CompanyDataDelegate {
    var companies = [Company]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchCompanies()
        self.setupView()
        self.setupTableView()
    }
    
    func didEditCompany(company: Company) {
        print("reachable")
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
    
    func amountOfRowsForTableView() -> Int {
        return companies.count
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
    
    func fetchCompanies() {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        // let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Company") // the next line does the same, but is more specific "<Company>"
        let fetchRequest = NSFetchRequest<Company>(entityName: "Company")
        
        do {
            let resultFetch = try context.fetch(fetchRequest)            
            self.updateCompanyList(companiesArray: resultFetch)
        } catch let fetchError {
            print("Failed to fetch companies:", fetchError)
        }
    }
    
    private func updateCompanyList(companiesArray: [Company]) {
        self.companies = companiesArray
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
}

