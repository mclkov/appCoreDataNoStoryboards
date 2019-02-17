//
//  IndentedLabel.swift
//  1CoreData
//
//  Created by McL on 2/17/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

class IndentedLabel: UILabel {
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        let newRect = rect.inset(by: insets)
        super.drawText(in: newRect)
    }
}
