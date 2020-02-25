//
//  courseAuthorView.swift
//  Tensend(new)
//
//  Created by Sultan on 2/24/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy

class CourseAuthorView: UIView {

    let stackView = UIStackView()
    let titleStackView = UIStackView()
    init(parrentVC: UIViewController) {
        super.init(frame: .zero)
        set()
        
    }
    
 
    func set(){
        addSubview(stackView)
        stackView.easy.layout(Edges())
        stackView.setProperties(axis: .horizontal, alignment: .fill, spacing: 7, distribution: .fill)
        titleStackView.setProperties(axis: .vertical, alignment: .fill, spacing: 3, distribution: .fill)
        let ava = UIImageView()
        ava.easy.layout(Height(34),Width(34))
        ava.image = #imageLiteral(resourceName: "Снимок экрана -5")
        stackView.addArrangedSubview(ava)
        let authorLabel = UILabel()
        authorLabel.setProperties(text: "Автор", font: .systemFont(ofSize: 13, weight: .medium))
        let nameLabel = UILabel()
        nameLabel.setProperties(text: "Інжү Әнуарбекқызы", font: .systemFont(ofSize: 10, weight: .medium))
        titleStackView.addArrangedSubview(authorLabel)
        titleStackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(titleStackView)
        
    }

    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
}
