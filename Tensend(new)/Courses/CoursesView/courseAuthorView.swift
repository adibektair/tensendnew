//
//  courseAuthorView.swift
//  Tensend(new)
//
//  Created by Sultan on 2/24/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit

class courseAuthorView: UIView {

    let stackView = UIStackView()
    let titleStackView = UIStackView()
    init(parrentVC: UIViewController) {
        super.init(frame: .zero)
        
        
    }
    
 
    func set(){
        stackView.setProperties(axis: .horizontal, alignment: .fill, spacing: 2, distribution: .fill)
        let stackView = UIStackView()
        
    }

    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
}
