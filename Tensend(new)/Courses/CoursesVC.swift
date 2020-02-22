//
//  CoursesVC.swift
//  Tensend(new)
//
//  Created by Sultan on 2/20/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit

class CoursesVC: ScrollStackController {

    override func viewDidLoad() {
        super.viewDidLoad()

        stackView.setSpacing(top: 15, left: 30, right: 30, bottom: 0)
        
        let search = SearchView(parrnetVC: self)
        search.dropShadowBlue()
        stackView.addArrangedSubview(search)
        
        let section = SectionsName()
        section.setData(title: "ҮЗДІК КУРСТАР", desc: "Сізге ұнауы мүмкін сабақтар тізімі")
        stackView.addArrangedSubview(section)
        
        let bestCourses = BestCourses.init(parrentVC: self)
        bestCourses.dropShadowBlue()
        stackView.addArrangedSubview(bestCourses)
        
        let twoButtons = TwoButtons(parrentVC: self, leftPressed: {
            print("LEFT")
        }) {
            print("RIGHT")
        }
        twoButtons.dropShadowBlue()
    
        stackView.addArrangedSubview(twoButtons)
        
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
