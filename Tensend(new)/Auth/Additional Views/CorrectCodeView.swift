//
//  CorrectCodeView.swift
//  Tensend(new)
//
//  Created by root user on 2/10/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit

class CorrectCodeView: UIView {
    
    let view = UIView()
    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()
    
    override func draw(_ rect: CGRect) {
        self.backgroundColor = .clear
        self.frame.size = CGSize(width: 60, height: 12)
        view.backgroundColor = #colorLiteral(red: 0, green: 0.8274509804, blue: 0, alpha: 1)
        view1.backgroundColor = #colorLiteral(red: 0, green: 0.8274509804, blue: 0, alpha: 1)
        view2.backgroundColor = #colorLiteral(red: 0, green: 0.8274509804, blue: 0, alpha: 1)
        view3.backgroundColor = #colorLiteral(red: 0, green: 0.8274509804, blue: 0, alpha: 1)
        view.frame = CGRect(x: 0, y: 0, width: 11, height: 11)
        view1.frame = CGRect(x: 16, y: 0, width: 11, height: 11)
        view2.frame = CGRect(x: 32, y: 0, width: 11, height: 11)
        view3.frame = CGRect(x: 48, y: 0, width: 11, height: 11)
        view.cornerRadius(radius: 5.5, width: 0, color: .clear)
        view1.cornerRadius(radius: 5.5, width: 0, color: .clear)
        view2.cornerRadius(radius: 5.5, width: 0, color: .clear)
        view3.cornerRadius(radius: 5.5, width: 0, color: .clear)
        self.addSubview(view)
        self.addSubview(view1)
        self.addSubview(view2)
        self.addSubview(view3)
    }

    
}
