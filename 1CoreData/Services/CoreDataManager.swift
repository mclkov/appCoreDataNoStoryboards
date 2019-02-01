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
        let context = CoreDataManager.shared.persistentContainer.viewContext
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
}
