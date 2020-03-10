//
//  TextFieldView.swift
//  Tensend(new)
//
//  Created by root user on 3/9/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit


class TextFieldView: UIView {

    let stackView = UIStackView()
    let label = UILabel()
    let textField = UITextField()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 10, distribution: .fill)
        self.label.font = label.font.withSize(15)
        self.label.textColor = .black
        self.textField.borderStyle = .none
        self.stackView.addArrangedSubview(label)
        self.stackView.addArrangedSubview(textField)
        let view = UIView()
        view.backgroundColor = .gray
        view.frame.size.height = 1
        view.frame.size.width = UIScreen.main.bounds.width - 30
        self.stackView.addArrangedSubview(view)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
