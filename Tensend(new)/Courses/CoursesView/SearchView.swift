//
//  SearchView.swift
//  Tensend(new)
//
//  Created by Sultan on 2/20/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy

class SearchView: UIView {
    
    var parrentVC = UIViewController()
    var stackView = UIStackView()
    let textField = UITextField()
    let searchButton = UIButton()
    init(parrnetVC: UIViewController) {
        super.init(frame: .zero)
        self.parrentVC = parrnetVC
        setViews()
    }
    func setViews(){
        self.backgroundColor = .white
        
        self.cornerRadius(radius: 15, width: 0)
        stackView.setProperties(axis: .horizontal, alignment: .fill, spacing: 2, distribution: .fill)
        addSubview(stackView)
        stackView.easy.layout(Edges(10))
        
        textField.placeholder = "Іздегеніңізді жазыңыз"
        textField.placeholderColor(color: .gray)
        stackView.addArrangedSubview(textField)
        
        searchButton.easy.layout(Height(50),Width(50))
        searchButton.backgroundColor = #colorLiteral(red: 0, green: 0.3019607843, blue: 0.7882352941, alpha: 1)
        searchButton.cornerRadius(radius: 9, width: 0)
        searchButton.setImage(#imageLiteral(resourceName: "search"), for: .normal)
        stackView.addArrangedSubview(searchButton)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
