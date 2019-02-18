//
//  CreateEmployee.swift
//  1CoreData
//
//  Created by McL on 2/18/19.
//  Copyright © 2019 McL. All rights reserved.
//

import Foundation

enum EmployeeType {
    case executive
    case seniorManagement
    case staff
}

struct EmployeeProperties {
    let name: String
    let birthday: Date
    let company: Company
    let employeeType: EmployeeType
}
