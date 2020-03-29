//
//  AboutCourseVC.swift
//  Tensend(new)
//
//  Created by Sultan on 2/24/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy
import Cosmos

class AboutCourseVC: ScrollStackController {

    // MARK: - Navigation
    var id = 1
    var object : ForMe?
    var started = false
    let cosmos = CosmosView()
    
    // MARK: - Navigation
    let containerStack = UIStackView()
    override func viewDidLoad() {
        super.viewDidLoad()
        sizes()
        getData()
//        views()
    }
    
    // MARK: - Navigation

    func sizes() {
        self.additionalSafeAreaInsets.top = -145
        stackView.setSpacing(top: 0, left: 0, right: 0, bottom: 30)
    }
    
    func views() {
        if let obj = object?.courses {
            let video = VideoView(parrentVC: self, obj: obj,done: nil)
            stackView.addArrangedSubview(video)
        }
        containerStack.setProperties(axis: .vertical, alignment: .fill, spacing: 16, distribution: .fill)
        containerStack.setSpacing(top: 0, left: 30, right: 30, bottom: 0)
        stackView.addArrangedSubview(containerStack)
        
        
        let courseNameStackView = UIStackView()
        var name = ""
        if let text = object?.courses?.title {
            name = text
        }
        courseNameStackView.setProperties(axis: .horizontal, alignment: .fill, spacing: 2, distribution: .fill)
        
        
        let titleLabel = UILabel()
        titleLabel.setProperties(text: name, font: .systemFont(ofSize: 20, weight: .semibold),numberLines: 3)
        
        cosmos.rating = Double(object?.courses?.scale ?? 0)
        cosmos.settings.starMargin = 5
        cosmos.easy.layout(Width(120))
        cosmos.settings.updateOnTouch = false
        courseNameStackView.addArrangedSubview(titleLabel)
        
        courseNameStackView.addArrangedSubview(cosmos)
        containerStack.addArrangedSubview(courseNameStackView)
        
        if let authorData = object?.courses?.author {
            let author = CourseAuthorView(parrentVC: self, author: authorData)
            containerStack.addArrangedSubview(author)
        }
        
       
        var descText = ""
        if let desc = object?.courses?.descriptionField {
            descText = desc
        }
        let descLabel = UILabel()
        descLabel.setProperties(text: descText, font: .systemFont(ofSize: 14), numberLines: 0)
        containerStack.addArrangedSubview(descLabel)
        
        let lessonsCountLabel = UILabel()
        var lessonsCountText = ""
        if let count = object?.courses?.lessonsCount {
           lessonsCountText = "\(count) cабақ"
        }
        lessonsCountLabel.setProperties(text: lessonsCountText, textColor: .lightGray, numberLines: 1)
        containerStack.addArrangedSubview(lessonsCountLabel)
        
        let goalLabel = UILabel()
        let goalText = "Бұл курстан не аласыз?"
        goalLabel.setProperties(text: goalText, font: .systemFont(ofSize: 20, weight: .semibold))
        containerStack.addArrangedSubview(goalLabel)
        if let list = object?.courses?.informationList {
            for item in list{
                let a = blueDot(text: item)
                containerStack.addArrangedSubview(a)
            }
        }
        
        let startButton = UIButton()
        startButton.setTitle("БАСТАЙМЫН", for: .normal)
        if self.started {
            startButton.setTitle("ЖАЛҒАСТЫРУ", for: .normal)
        }
        startButton.backgroundColor = #colorLiteral(red: 0, green: 0.2823529412, blue: 0.8039215686, alpha: 1)
        startButton.cornerRadius(radius: 15, width: 0)
        startButton.easy.layout(Height(58))
        startButton.addTapGestureRecognizer {
            self.startLesson()
        }
        containerStack.addArrangedSubview(startButton)
    }

    func blueDot(text:String) -> UIStackView{
        let blueDotStack = UIStackView()
        let dot = UIView()
        let dotStack = UIStackView()
        dotStack.setProperties(axis: .vertical, alignment: .fill, spacing: 0, distribution: .fill)
        
        dot.backgroundColor = #colorLiteral(red: 0, green: 0.2823529412, blue: 0.8039215686, alpha: 1)
        dot.cornerRadius(radius: 7, width: 2,color: #colorLiteral(red: 0.5725490196, green: 0.6823529412, blue: 0.9098039216, alpha: 1))
        dot.easy.layout(Height(14),Width(14))
        dotStack.addArrangedSubview(dot)
        dotStack.addArrangedSubview(UIView())
        blueDotStack.addArrangedSubview(dotStack)
        blueDotStack.setProperties(axis: .horizontal, alignment: .fill, spacing: 25, distribution: .fill)
        let titleLabel = UILabel()
        titleLabel.setProperties(text: text, font: .systemFont(ofSize: 14), numberLines: 0)
        blueDotStack.addArrangedSubview(titleLabel)
        return blueDotStack
    }
    static func open(vc: UIViewController,id: Int,started: Bool) {
        let viewController = AboutCourseVC()
        viewController.id = id
        viewController.started = started
        if let nav = vc.navigationController {
            nav.pushViewController(viewController, animated: true)
        }
    }
    
    func getData(){
        HomeRequests.sharedInstance.getCourse(id: "\(id)") { (result) in
            self.object = result
            self.views()
        }
    }
    func startLesson(){
        HomeRequests.sharedInstance.startLesson(id: "\(id)") { (result) in
            if let success = result.success, success == true {
                let courseId = self.object?.courses?.id ?? 0
                SubjectVC.open(vc: self, courseID: courseId, materialId: courseId)
            }
        }
    }
    /*

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
