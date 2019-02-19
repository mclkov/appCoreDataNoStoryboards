//
//  EmployeeType.swift
//  1CoreData
//
//  Created by McL on 2/19/19.
//  Copyright © 2019 McL. All rights reserved.
//

import Foundation

protocol EmployeeTypeDescription {
    var description: String { get }
}

enum EmployeeType: Int, EmployeeTypeDescription {
    static var allCases: [EmployeeType] {
        return [.Executive, .SeniorManagement, .Staff]
    }

    static var allCasesDescription: [String] {
        var cases = [String]()
        allCases.forEach { (employeeType) in
            cases.append(employeeType.description)
        }
        
        return cases
    }
    
    case Executive
    case SeniorManagement
    case Staff
    
    var description: String {
        switch self {
        case .Executive:
            return "Executive"
        case .SeniorManagement:
            return "Senior Management"
        case .Staff:
            return "Staff"
        }
    }
}
