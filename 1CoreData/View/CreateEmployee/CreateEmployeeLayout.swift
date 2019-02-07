//
//  CreateEmployeeLayout.swift
//  1CoreData
//
//  Created by McL on 2/7/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension CreateEmployeeVC {
    func setupView() {
        self.setupNavigationItem()
        self.setupBackgroundColor()
        self.setupBackgroundView()
    }
    
    func setupNavigationItem() {
        self.setupNavigationTitle("Create Employee")
        self.setupLeftButtonInNavigationBar(title: "Cancel", selector: #selector(self.dismissByCancelPressed))
    }
    
    func setupBackgroundColor() {
        view.backgroundColor = ColorScheme.darkBlue
    }
    
    private func setupBackgroundView() {
        view.addSubview(backgroundView)
        self.setupBackgroundViewAnchors()
    }
    
    private func setupBackgroundViewAnchors() {
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
