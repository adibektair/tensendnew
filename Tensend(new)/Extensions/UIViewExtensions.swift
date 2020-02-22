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
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func cornerRadius(radius: Int, width: CGFloat, color: UIColor = .white){
         //  self.layer.masksToBounds = true
           self.layer.cornerRadius = CGFloat(radius)
           self.layer.borderWidth = width
           self.layer.borderColor = color.cgColor
    }
    func cornerRadius(radius: Double, width: CGFloat, color: UIColor){
           self.layer.masksToBounds = true
           self.layer.cornerRadius = CGFloat(radius)
           self.layer.borderWidth = width
           self.layer.borderColor = color.cgColor
    }

}
