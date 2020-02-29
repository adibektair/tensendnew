//
//  AboutCourseVC.swift
//  Tensend(new)
//
//  Created by Sultan on 2/24/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy

class AboutCourseVC: ScrollStackController {

    // MARK: - Navigation
    let containerStack = UIStackView()
    override func viewDidLoad() {
        super.viewDidLoad()

        sizes()
        views()
    }
    
    // MARK: - Navigation

    func sizes() {
        stackView.setSpacing(top: 0, left: 0, right: 0, bottom: 30)
    }
    
    func views() {
        let video = VideoView(parrentVC: self)
        stackView.addArrangedSubview(video)
        
        containerStack.setProperties(axis: .vertical, alignment: .fill, spacing: 16, distribution: .fill)
        containerStack.setSpacing(top: 0, left: 30, right: 30, bottom: 0)
        stackView.addArrangedSubview(containerStack)
        
        
        let courseNameLabel = UILabel()
        courseNameLabel.setProperties(text: "Сымбатты мүсін", textColor: #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1), font: .systemFont(ofSize: 20, weight: .semibold), textAlignment: .left, numberLines: 1)
        
        let titleLabel = UILabel()
        titleLabel.setProperties(text: "Сымбатты мүсін", font: .systemFont(ofSize: 20, weight: .semibold))
        containerStack.addArrangedSubview(titleLabel)
        
        let author = CourseAuthorView(parrentVC: self)
        containerStack.addArrangedSubview(author)
       
        let descText = "Сайт рыбатекст поможет дизайнеру, верстальщику, вебмастеру сгенерировать несколько абзацев более менее осмысленного текста рыбы на русском языке, а начинающему оратору отточить навык публичных выступлений в домашних условиях. При создании генератора мы использовали небезизвестный универсальный код речей."
        let descLabel = UILabel()
        descLabel.setProperties(text: descText, font: .systemFont(ofSize: 14), numberLines: 0)
        containerStack.addArrangedSubview(descLabel)
        
        let lessonsCountLabel = UILabel()
        let lessonsCountText = "25 cабақ | 2-3 минут"
        lessonsCountLabel.setProperties(text: lessonsCountText, textColor: .lightGray, numberLines: 1)
        containerStack.addArrangedSubview(lessonsCountLabel)
        
        let goalLabel = UILabel()
        let goalText = "Бұл курстан не аласыз?"
        goalLabel.setProperties(text: goalText, font: .systemFont(ofSize: 20, weight: .semibold))
        containerStack.addArrangedSubview(goalLabel)
        
        let a = blueDot()
        let b = blueDot()
        let c = blueDot()
        containerStack.addArrangedSubview(a)
        containerStack.addArrangedSubview(b)
        containerStack.addArrangedSubview(c)
        
        let startButton = UIButton()
        startButton.setTitle("БАСТАЙМЫН", for: .normal)
        startButton.backgroundColor = #colorLiteral(red: 0, green: 0.2823529412, blue: 0.8039215686, alpha: 1)
        startButton.cornerRadius(radius: 15, width: 0)
        startButton.easy.layout(Height(58))
        containerStack.addArrangedSubview(startButton)
    }

    func blueDot() -> UIStackView{
        let blueDotStack = UIStackView()
        let dot = UIView()
        dot.backgroundColor = #colorLiteral(red: 0, green: 0.2823529412, blue: 0.8039215686, alpha: 1)
        dot.cornerRadius(radius: 7, width: 2,color: #colorLiteral(red: 0.5725490196, green: 0.6823529412, blue: 0.9098039216, alpha: 1))
        dot.easy.layout(Height(14),Width(14))
        blueDotStack.addArrangedSubview(dot)
        blueDotStack.setProperties(axis: .horizontal, alignment: .fill, spacing: 25, distribution: .fill)
        let titleLabel = UILabel()
        titleLabel.setProperties(text: "Өзіңізді жеңіл сезінетін боласыз", font: .systemFont(ofSize: 14), numberLines: 2)
        blueDotStack.addArrangedSubview(titleLabel)
        return blueDotStack
    }
    static func open(vc: UIViewController) {
        let viewController = AboutCourseVC()
        if let nav = vc.navigationController {
            nav.pushViewController(viewController, animated: true)
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
