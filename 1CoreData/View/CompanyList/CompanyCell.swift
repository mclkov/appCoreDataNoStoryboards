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
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = ColorScheme.darkBlue.cgColor
        return imageView
    }()
    
    let details: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "test data"
        label.textColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    func setupView() {
        self.setupBackgroundColor()
        self.setupCompanyImage()
        self.setupNameAndFounded()
    }
    
    private func setupBackgroundColor() {
        backgroundColor = ColorScheme.teal
    }
    
    private func setupCompanyImage() {
        addSubview(companyImage)
        self.setupCompanyImageAnchors()
    }
    
    private func setupCompanyImageAnchors() {
        companyImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        companyImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        companyImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        companyImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func setupNameAndFounded() {
        addSubview(details)
        self.setupNameAndFoundedAnchors()
    }
    
    private func setupNameAndFoundedAnchors() {
        details.topAnchor.constraint(equalTo: topAnchor).isActive = true
        details.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        details.leftAnchor.constraint(equalTo: companyImage.rightAnchor, constant: 8).isActive = true
        details.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(company: Company) {
        var companyInfo = ""
        if let name = company.name, let founded = company.founded {
            let foundedDateString = self.companyFoundedDateToString(date: founded)
            companyInfo = "\(name), founded: \(foundedDateString)"
        }else{
            companyInfo = company.name ?? ""
        }
        details.text = companyInfo
        
        if let imageData = company.imageData {
            companyImage.image = UIImage(data: imageData)
        }
    }
    
    func companyFoundedDateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter.string(from: date)
    }
}
