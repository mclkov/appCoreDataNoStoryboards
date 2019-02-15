//
//  CoreDataManager.swift
//  1CoreData
//
//  Created by McL on 1/22/19.
//  Copyright © 2019 McL. All rights reserved.
//

import CoreData

struct CoreDataManager {
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores { (storeDescritpion, error) in
            if let error = error {
                fatalError("Loading of store failed \(error)")
            }
        }
        return container
    }()
    
    func fetchCompanies() -> [Company] {
        let context = persistentContainer.viewContext
        // let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Company") // the next line does the same, but is more specific "<Company>"
        let fetchRequest = NSFetchRequest<Company>(entityName: "Company")
        
        do {
            let resultFetch = try context.fetch(fetchRequest)
            return resultFetch
        } catch let fetchError {
            print("Failed to fetch companies:", fetchError)
            return []
        }
    }
    
    func resetCompanies() {
        let context = persistentContainer.viewContext
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: Company.fetchRequest())
        
        do {
            try context.execute(batchDeleteRequest)
        } catch let deleteError {
            print("Failed to delete objects from CoreData:", deleteError)
        }
    }
    
    func removeCompany(_ company: Company) {
        let context = persistentContainer.viewContext
        context.delete(company)
        
        do {
            try context.save()
        } catch let saveError {
            print("Failed to delete company", saveError)
        }
    }
    
    func createEmployee(employeeName: String, company: Company) -> (Employee?, Error?) {
        let context = persistentContainer.viewContext
        let employeeManagedObject = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context)
        employeeManagedObject.setValue(employeeName, forKey: "name")

        guard let employee = employeeManagedObject as? Employee else {
            let castError = NSError(domain: "Cannot cast employeeManagedObject to Employee", code: 0, userInfo: nil)
            return (nil, castError)
        }
        
        employee.company = company
        
        do {
            try context.save()
            return (employee, nil)
        } catch let saveError {
            print("Failed to create employee", saveError)
            return (nil, saveError)
        }
    }
}
