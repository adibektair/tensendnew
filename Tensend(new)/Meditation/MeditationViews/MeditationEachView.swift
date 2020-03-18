//
//  MeditationEachView.swift
//  Tensend(new)
//
//  Created by root user on 2/24/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy

class MeditationEachView: UIView {

    let mainStackView = UIStackView()
    let imageView = UIImageView()
    let arrowImageView = UIImageView()
    let titleLabel = UILabel()
    let timeLabel = UILabel()
    let middleStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        mainStackView.setProperties(axis: .horizontal, alignment: .fill, spacing: 5, distribution: .fill)
        self.addSubview(mainStackView)
        mainStackView.easy.layout(Edges(0))
        mainStackView.addArrangedSubview(imageView)
        imageView.contentMode = .scaleToFill
        imageView.easy.layout(Width(88))
        imageView.layer.masksToBounds = true
        
        middleStackView.setProperties(axis: .vertical, alignment: .fill, spacing: 3, distribution: .fillProportionally)
        mainStackView.addArrangedSubview(middleStackView)
        middleStackView.addArrangedSubview(titleLabel)
        middleStackView.addArrangedSubview(timeLabel)
        titleLabel.textColor = .black
        timeLabel.textColor = .black
        titleLabel.font = titleLabel.font.withSize(13)
        timeLabel.font = timeLabel.font.withSize(10)
        arrowImageView.image = #imageLiteral(resourceName: "Arrow")
        mainStackView.addArrangedSubview(UIView())
        let container = UIView()
        container.addSubview(arrowImageView)
        arrowImageView.easy.layout(Height(13),Width(10),CenterY(),Left(),Right(20))
        mainStackView.addArrangedSubview(container)
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
