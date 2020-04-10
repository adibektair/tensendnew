//
//  CoursesListVC.swift
//  Tensend(new)
//
//  Created by Sultan on 2/24/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit

class CoursesListVC: ScrollStackController {

    // MARK: - Variables
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let title = UILabel()
        self.navigationItem.title = "Курстар тізімі"
        let text = "Өзіңізге қажет саланы таңдаңыз"
        title.setProperties(text: text, textColor: #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1), font: .systemFont(ofSize: 14), textAlignment: .center, numberLines: 1)
        self.stackView.addArrangedSubview(title)
        
        let cours = AllCoursesListView(parrentVC: self)
        cours.stackView.setSpacing(top: 0, left: 30, right: 30, bottom: 40)
        stackView.addArrangedSubview(cours)
    }
    

    static func open(vc: UIViewController) {
        let viewController = CoursesListVC()
        if let nav = vc.navigationController {
            nav.pushViewController(viewController, animated: true)
        }
    }
}
