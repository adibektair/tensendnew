//
//  CoursesVC.swift
//  Tensend(new)
//
//  Created by Sultan on 2/20/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy

class CoursesVC: ScrollStackController {
    
    let container = UIView()
    var cours : AllCoursesListView?
    let stackV = UIStackView()
    let emptyIcon = UIImageView()
    let titleLabel = UILabel()
    var mc : MyCourses?
    let text = "Cізде әлі басталған курстар жоқ. Дәл қазір жаңа курс бастауға керемет мүмкіндік!"
    override func viewDidLoad() {
        super.viewDidLoad()
        makeNCTranslucent()
        stackView.setSpacing(top: 15, left: 30, right: 30, bottom: 0)
        cours = AllCoursesListView(parrentVC: self)
        stackV.setProperties(axis: .vertical, alignment: .fill, spacing: 10, distribution: .fill)
        setSubViews()
        
    }
    func setSubViews(){
        let search = SearchView(parrnetVC: self)
        search.dropShadowBlue()
        //                stackView.addArrangedSubview(search)
        
        let section = SectionsName()
        section.setData(title: "ҮЗДІК КУРСТАР", desc: "Сізге ұнауы мүмкін сабақтар тізімі")
        stackView.addArrangedSubview(section)
        
        let bestCourses = BestCourses.init(parrentVC: self)
        bestCourses.dropShadowBlue()
        //                stackView.addArrangedSubview(bestCourses)
        
        let forYou = ForYou()
        stackView.addArrangedSubview(forYou)
        let twoButtons = TwoButtons(parrentVC: self, leftPressed: {
            print("LEFT")
            self.coursesList()
        }) {
            print("RIGHT")
            self.inProccess()
        }
        //        twoButtons.dropShadowBlue()
        
        stackView.addArrangedSubview(twoButtons)
        coursesList()
    }
    
    func coursesList(){
        
        if self.stackView.arrangedSubviews.contains(container) {
            container.isHidden = true
        }
        mc?.isHidden = true
        stackView.addArrangedSubview(cours!)
        cours?.isHidden = false
        
    }
    func inProccess(){
        if let _ = cours, self.stackView.arrangedSubviews.contains(cours!) {
            self.cours!.isHidden = true
        }
        
        container.isHidden = false
        container.addSubview(stackV)
        
        emptyIcon.image = #imageLiteral(resourceName: "No Courses")
        emptyIcon.easy.layout(Height(>=120))
        stackV.easy.layout(Top(),Bottom(),Left(>=0),Right(>=0),CenterX(),CenterY())
        stackV.addArrangedSubview(emptyIcon)
        titleLabel.setProperties(text: text, font: .systemFont(ofSize: 12), textAlignment: .center, numberLines: 0)
        stackV.addArrangedSubview(titleLabel)
        self.mc = MyCourses(parrentVC: self, id: 0, isMyCourses: true) { (noResult) in
            if noResult {
                self.stackView.addArrangedSubview(self.container)
            }
        }
        mc?.stackview.setSpacing()
        mc?.allButton.isHidden = true
        mc?.isHidden = false
        self.stackView.addArrangedSubview(self.mc!)
        
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
