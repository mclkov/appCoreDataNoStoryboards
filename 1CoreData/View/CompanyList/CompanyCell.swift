//
//  CompanyCell.swift
//  1CoreData
//
//  Created by McL on 1/16/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

class CompanyCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var founded: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(company: Company) {
        self.backgroundColor = ColorScheme.teal
        self.name.text = company.name ?? ""
        
//        self.founded.text = company.founded ?? ""
    }
}
