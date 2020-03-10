//
//  SmallView.swift
//  Tensend(new)
//
//  Created by root user on 3/1/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy

class SmallView: UIView {
    
    let titleLabel = UILabel()
    let imageView = UIImageView()
    let numberLabel = UILabel()
    let stackView = UIStackView()
    
    init(title: String, amount: Int, image: UIImage) {
        let size = UIScreen.main.bounds.size
        super.init(frame: .zero)
        self.addSubview(stackView)
        self.stackView.easy.layout(Edges())
        stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 5, distribution: .fill)
        titleLabel.setProperties(text: title,font: .systemFont(ofSize: 16),textAlignment: .center, numberLines: 2)
        stackView.addArrangedSubview(titleLabel)
        imageView.image = image
        
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        let w = size.width / 2 - 10
        imageView.easy.layout(Height(w - 25), Width(w))
        imageView.addSubview(numberLabel)
        numberLabel.setProperties(text: "\(amount)", textColor: .white, font: numberLabel.font.withSize(33), textAlignment: .center, numberLines: 1)
        numberLabel.easy.layout(CenterY(),CenterX())
        stackView.addArrangedSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
