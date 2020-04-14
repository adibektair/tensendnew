
//
//  AllMycoursesvC.swift
//  Tensend(new)
//
//  Created by Sultan on 4/5/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit

class AllMycoursesVC: ScrollStackController {

    // MARK: - Navigation
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        self.navigationItem.title = "Менің курстарым"
        let list = MyCourses(parrentVC: self, id: 0,isMyCourses: true,listAll: true)
        stackView.addArrangedSubview(list)
    }
    

    static func open(vc: UIViewController) {
        let viewController = AllMycoursesVC()
         if let nav = vc.navigationController {
             nav.pushViewController(viewController, animated: true)
         }
     }
}

