//
//  CoursesByCategoryVC.swift
//  Tensend(new)
//
//  Created by Sultan on 2/24/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit

class CoursesByCategoryVC: ScrollStackController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let text = "Ұнаған сабақты таңдаңыз"
        let title = UILabel()
        title.setProperties(text: text, textColor: #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1), font: .systemFont(ofSize: 14), textAlignment: .center, numberLines: 1)
        stackView.addArrangedSubview(title)
        
        let list = MyCourses(parrentVC: self)
        stackView.addArrangedSubview(list)
    }
 
    static func open(vc: UIViewController) {
         let viewController = CoursesByCategoryVC()
         if let nav = vc.navigationController {
             nav.pushViewController(viewController, animated: true)
         }
     }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
