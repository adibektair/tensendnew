//
//  MaterialListView.swift
//  Tensend(new)
//
//  Created by Sultan on 3/2/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy

class MaterialListView: UIView {
    
    var course: Course?
    var stackView = UIStackView()
    var materialID = 0
    var pressed: ((Int) -> Void)?
    init(course: Course,
         materialID : Int,
        pressed: ((Int) -> Void)?) {
        super.init(frame: .zero)
        self.course = course
        self.materialID = materialID
        self.pressed = pressed
        addSubview(stackView)
        stackView.easy.layout(Edges())
        stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 5, distribution: .fill)
        sizes()
    }
    func reload(){
        stackView.removeAllArrangedSubviews()
        sizes()
    }
    func sizes(){
        
        if let lessons = course?.lessons {
            let gotAccess = lessons.filter({$0.access! == true})
            for i in gotAccess {
                let a = self.eachLesson(lesson: i)
                self.stackView.addArrangedSubview(a)
            }
            if gotAccess.count != lessons.count {
                let inviteLabel = UILabel()
                inviteLabel.easy.layout(Height(121))
                inviteLabel.setProperties(text: "Tensend-ке жазылып,барлық курстарды ашыңыз", textColor: .white, font: .systemFont(ofSize: 17, weight: .semibold), textAlignment: .center, numberLines: 0)
                inviteLabel.backgroundColor = #colorLiteral(red: 0, green: 0.2823529412, blue: 0.8039215686, alpha: 1)
                self.stackView.addArrangedSubview(inviteLabel)
            }
            
            let closedList = lessons.filter({$0.access! == false })
            for i in closedList {
                let a = self.eachLesson(lesson: i)
                self.stackView.addArrangedSubview(a)
            }
         
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func eachLesson(lesson: Lesson) -> UIStackView{
        let a = UIStackView()
        a.setProperties(axis: .horizontal, alignment: .fill, spacing: 24, distribution: .fill)
        a.addBackgroundColor(color: .white)
        let b = UIStackView()
        b.setProperties(axis: .vertical, alignment: .fill, spacing: 15, distribution: .fill)
        a.setSpacing(top: 20, left: 30, right: 30, bottom: 20)
        
        let img = UIImageView()
        img.easy.layout(Height(80),Width(109))
        img.image = #imageLiteral(resourceName: "Group 13")
        img.cornerRadius(radius: 12, width: 0)
        img.layer.masksToBounds = true
        if let image = lesson.imgPath {
            img.sd_setImage(with: URL(string: imageUrl + (image.encodeUrl)), completed: nil)
        }
        a.addArrangedSubview(img)
        
        let titleLabel = UILabel()
        titleLabel.setProperties(text: "?. Алғашқы қадам", font: .systemFont(ofSize: 16, weight: .semibold), numberLines: 3)
        if let t = lesson.title {
            titleLabel.text = t
        }
        b.addArrangedSubview(titleLabel)
        let lessonDuration = UILabel()
        lessonDuration.setProperties(text: "X минут", textColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), font: .systemFont(ofSize: 12))
        if let duration = lesson.durationTime {
            lessonDuration.text = "\(duration) минут"
        }
        b.addArrangedSubview(lessonDuration)
        b.addArrangedSubview(UIView())
        a.addArrangedSubview(b)
        if let id = lesson.id, id == materialID {
            if let layer = a.layer.sublayers?.first {
                layer.backgroundColor = #colorLiteral(red: 0, green: 0.2823529412, blue: 0.8039215686, alpha: 1)
            }
            titleLabel.textColor = .white
            lessonDuration.textColor = .white
        }
        if let access = lesson.access, !access {
            let closed = self.closedView()
            img.addSubview(closed)
            closed.easy.layout(Edges())
        } else {
            if let id = lesson.id {
                a.addTapGestureRecognizer {
                    self.materialID = id
                    self.pressed!(id)
                }
            }
        }
        if let passed = lesson.passed, passed {
            let passedView = self.passedView()
            img.addSubview(passedView)
            passedView.easy.layout(Edges())
        }
        return a
    }
    func closedView() -> UIView{
        let v = UIView()
        let closedImg = UIImageView()
        v.addSubview(closedImg)
        closedImg.easy.layout(Width(15),Height(20),CenterY(),CenterX())
        closedImg.image = #imageLiteral(resourceName: "closed")
        v.backgroundColor = #colorLiteral(red: 0.2509803922, green: 0.2509803922, blue: 0.2509803922, alpha: 0.62)
        return v
    }
    func passedView() -> UIView{
        let v = UIView()
        let closedImg = UIImageView()
        v.addSubview(closedImg)
        closedImg.easy.layout(Width(15),Height(20),CenterY(),CenterX())
        closedImg.image = #imageLiteral(resourceName: "passed")
        v.backgroundColor = #colorLiteral(red: 0, green: 0.8117647059, blue: 0.768627451, alpha: 0.62)
        return v
    }
    
}
