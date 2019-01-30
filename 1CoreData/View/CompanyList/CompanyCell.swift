//
//  CompanyCell.swift
//  1CoreData
//
//  Created by McL on 1/16/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

class CompanyCell: UITableViewCell {
    @IBOutlet weak var companyImage: UIImageView! = {
        let imageView = UIImageView(image: UIImage(named: HomeConstants.noImageFile))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    @IBOutlet weak var name: UILabel! = {
       return UILabel()
    }()
    
    @IBOutlet weak var founded: UILabel! = {
        return UILabel()
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(company: Company) {
        self.backgroundColor = ColorScheme.teal
        self.name.text = company.name ?? ""
        
//        self.founded.text = company.founded ?? ""
    }
}
