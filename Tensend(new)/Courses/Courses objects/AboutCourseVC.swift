//
//  AboutCourseVC.swift
//  Tensend(new)
//
//  Created by Sultan on 2/24/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit

class AboutCourseVC: ScrollStackController {

    override func viewDidLoad() {
        super.viewDidLoad()

        sizes()
        
    }
    
    func sizes() {
        
    }
    
    func views() {
        let video = VideoView(parrentVC: self)
        stackView.addArrangedSubview(video)
        
        let courseNameLabel = UILabel()
        courseNameLabel.setProperties(text: "Сымбатты мүсін", textColor: #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1), font: .systemFont(ofSize: 20, weight: .semibold), textAlignment: .left, numberLines: 1)
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
