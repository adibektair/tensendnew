//
//  LabelExtensions.swift
//  Tensend
//
//  Created by Sultan on 1/26/20.
//  Copyright © 2020 Sultan. All rights reserved.
//

import UIKit


extension UILabel{
    func setProperties(text: String = "",
                       textColor: UIColor = .black,
                       font: UIFont = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular),
                       textAlignment: NSTextAlignment = NSTextAlignment.left,
                       numberLines : Int = 1
        ) {
        self.text = text
        self.textColor = textColor
        self.font = font
        self.textAlignment = textAlignment
        self.numberOfLines = numberLines
    }
}
