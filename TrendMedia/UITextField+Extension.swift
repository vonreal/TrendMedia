//
//  UITextField+Extension.swift
//  TrendMedia
//
//  Created by 나지운 on 2022/07/19.
//

import UIKit

extension UITextField {
    
    func borderColor() {
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.borderWidth = 1.0
        self.borderStyle = .none
    }
}
