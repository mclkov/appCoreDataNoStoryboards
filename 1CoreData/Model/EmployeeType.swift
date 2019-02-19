//
//  EmployeeType.swift
//  1CoreData
//
//  Created by McL on 2/19/19.
//  Copyright © 2019 McL. All rights reserved.
//

import Foundation

enum EmployeeType: String {
    static var allCases: [EmployeeType] {
        return [.Executive, .SeniorManagement, .Staff]
    }
    
    static var allCasesRaw: [String] {
        return [EmployeeType.Executive.rawValue, EmployeeType.SeniorManagement.rawValue, EmployeeType.Staff.rawValue]
    }
    
    case Executive
    case SeniorManagement = "Senior Management"
    case Staff
}
