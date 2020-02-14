//
//  UIViewExtensions.swift
//  Tensend
//
//  Created by root user on 1/26/20.
//  Copyright © 2020 Sultan. All rights reserved.
//

import Foundation
import UIKit
extension UIView{
    func cornerRadius(radius: Int, width: CGFloat, color: UIColor = .white){
           self.layer.masksToBounds = true
           self.layer.cornerRadius = CGFloat(radius)
           self.layer.borderWidth = width
           self.layer.borderColor = color.cgColor
    }
    
}
