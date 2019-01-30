//
//  CompanyCell.swift
//  1CoreData
//
//  Created by McL on 1/16/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

class CompanyCell: UITableViewCell {
    let companyImage: UIImageView = {
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
        self.setupView()
    }
    
    func setupView() {
        self.setupCompanyImage()
    }
    
    func setupCompanyImage() {
        addSubview(companyImage)
        self.setupCompanyImageAnchors()
    }
    
    func setupCompanyImageAnchors() {
        companyImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        companyImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        companyImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        companyImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
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
