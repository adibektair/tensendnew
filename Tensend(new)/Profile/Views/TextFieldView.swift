//
//  TextFieldView.swift
//  Tensend(new)
//
//  Created by root user on 3/9/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy
import AKMaskField

class TextFieldView: UIView {

    let stackView = UIStackView()
    let label = UILabel()
    var textField = AKMaskField()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 10, distribution: .fill)
        
        self.label.font = label.font.withSize(15)
        self.label.textColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1)
        self.label.numberOfLines = 1
        self.label.textAlignment = .left
        self.textField.borderStyle = .none
        textField.textColor = .black
        self.stackView.addArrangedSubview(label)
        self.stackView.addArrangedSubview(textField)
        let view = UIView()
        view.backgroundColor = .gray
       
        self.stackView.addArrangedSubview(view)
        self.addSubview(stackView)

        view.easy.layout(Width(UIScreen.main.bounds.width - 30), Height(1))
        self.stackView.easy.layout(Edges(20))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(text:String){
        self.label.text = text
        self.textField.placeholder = text
    }
    
}
