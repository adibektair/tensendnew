//
//  MyCourses.swift
//  Tensend
//
//  Created by Sultan on 2/9/20.
//  Copyright © 2020 Sultan. All rights reserved.
//

import UIKit
import EasyPeasy

class MyCourses: UIView {

    var coursesList : ForMe?
    var parrentVC = UIViewController()
    let stackview = UIStackView()
    let allButton = UIButton()
    var count = 0
    var id = 1
    init(parrentVC: UIViewController,id:Int) {
        super.init(frame: .zero)
        self.id = id
        self.parrentVC = parrentVC
        size()
    }

    func size() {
        stackview.setProperties(axis: .vertical, alignment: .fill, spacing: 10, distribution: .fill)
        stackview.setSpacing(top: 0, left: 30, right: 30, bottom: 10)
        self.addSubview(stackview)
        allButton.setTitle("Барлығы", for: .normal)
        allButton.setTitleColor(#colorLiteral(red: 0.2039215686, green: 0.6509803922, blue: 0.337254902, alpha: 1), for: .normal)
        getData()
        addSubview(stackview)
        if (parrentVC as? HomeVC) != nil {
            addSubview(allButton)
            allButton.easy.layout(Left(30),Bottom())
            stackview.easy.layout(Top(),Left(),Right(),Bottom().to(allButton))
        } else {
            stackview.easy.layout(Edges())
        }
    }
    func getData(){
         HomeRequests.sharedInstance.coursesByCategory(id: "\(id)") { (result) in
            self.coursesList = result
            self.subViews()
         }
     }
    
    func subViews(){
        if let counter = coursesList?.courses?.data?.count, counter > 3 {
            self.count = counter
            if (parrentVC as? HomeVC) != nil, counter > 0, counter < 3 {
                self.count = 3
            }
        }
        
        
        for i in 0..<count {
            let data = coursesList!.courses!.data![i]
            let a = EachCourse(data: data)
            a.cornerRadius(radius: 8, width: 0)
            a.addTapGestureRecognizer {
                if let id = data.id {
                    AboutCourseVC.open(vc: self.parrentVC,id: id)
                }
            }
            stackview.addArrangedSubview(a)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
