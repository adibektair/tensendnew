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
    var author: Author?
    init(parrentVC: UIViewController, author:Author) {
        super.init(frame: .zero)
        self.author = author
        set()
        
    }
    
 
    func set(){
        addSubview(stackView)
        stackView.easy.layout(Edges())
        stackView.setProperties(axis: .horizontal, alignment: .fill, spacing: 7, distribution: .fill)
        titleStackView.setProperties(axis: .vertical, alignment: .fill, spacing: 3, distribution: .fill)
        let ava = UIImageView()
        ava.easy.layout(Height(34),Width(34))
        ava.cornerRadius(radius: 17, width: 0)
        ava.layer.masksToBounds = true
        ava.image = #imageLiteral(resourceName: "Снимок экрана -5")
        stackView.addArrangedSubview(ava)
        let authorLabel = UILabel()
        authorLabel.setProperties(text: "Автор", font: .systemFont(ofSize: 13, weight: .medium))
        let nameLabel = UILabel()
        nameLabel.setProperties(text: "", font: .systemFont(ofSize: 10, weight: .medium))
        let name = author?.name ?? ""
        let surname = author?.surname ?? ""
        nameLabel.text = name + " " + surname
        if let img = author?.imagePath {
            ava.sd_setImage(with: URL(string: imageUrl + (img.encodeUrl)))
        }
        titleStackView.addArrangedSubview(authorLabel)
        titleStackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(titleStackView)
        
    }

    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
}
