//
//  SubjectVC.swift
//  Tensend(new)
//
//  Created by Sultan on 3/1/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy

class SubjectVC: ScrollStackController {
    
    var forMe: ForMe?
    var material: MaterialResponse?
    var courseID = 0
    var materialId = 0
    var list : MaterialListView?
    var materialStackView = UIStackView()
    
    let titleLabel = UILabel()
    let descLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubview()
        //        materialStackView.isHidden = true
        getData()
    }
    
    func setData(){
        if let m = material?.material {
            if let title = m.title {
                titleLabel.text = title
            }
            if let desc = m.descriptionField {
                self.descLabel.text = desc
            }
            
            //            self.materialStackView.isHidden = false
        }
        
    }
    
    func setSubview(){
        //        let video = VideoView(parrentVC: self, obj: course!)
        //        stackView.addArrangedSubview(video)
        materialStackView.getProperties(stackView: self.stackView)
        materialStackView.setSpacing(top: 0, left: 31, right: 31, bottom: 0)
        
        titleLabel.setProperties(text: "1. Алғашқы қадам", font: .systemFont(ofSize: 20, weight: .semibold), numberLines: 2)
        materialStackView.addArrangedSubview(titleLabel)
        
        
        descLabel.setProperties(text: "description", font: .systemFont(ofSize: 14), numberLines: 0)
        materialStackView.addArrangedSubview(descLabel)
        
        let materials = UILabel()
        materials.setProperties(text: "Қосымша материалдар", font: .systemFont(ofSize: 16, weight: .medium))
        materialStackView.addArrangedSubview(materials)
        
        let materialsStack = UIStackView()
        materialsStack.setProperties(axis: .horizontal, alignment: .leading, spacing: 14, distribution: .fill)
        let docIMG = UIImageView()
        let pdfIMG = UIImageView()
        docIMG.easy.layout(Height(41),Width(36))
        pdfIMG.easy.layout(Height(41),Width(36))
        materialsStack.addArrangedSubview(pdfIMG)
        materialsStack.addArrangedSubview(docIMG)
        materialStackView.addArrangedSubview(materialsStack)
        
        let startButton = UIButton()
        startButton.setTitle("КЕЛЕСІ САБАҚ", for: .normal)
        startButton.backgroundColor = #colorLiteral(red: 0, green: 0.2823529412, blue: 0.8039215686, alpha: 1)
        startButton.cornerRadius(radius: 15, width: 0)
        startButton.easy.layout(Height(58))
        materialStackView.addArrangedSubview(startButton)
        stackView.addArrangedSubview(materialStackView)
    }
    func getData(){
//        stackView.removeAllArrangedSubviews()
//        materialStackView.removeAllArrangedSubviews()
        HomeRequests.sharedInstance.getCourse(id: "\(courseID)") { (result) in
            self.forMe = result
            if result.courses != nil {
                self.reload()
                self.getMaterial()
            }
        }
    }
    
    func reload(){
        if let course = self.forMe?.courses {
            self.list = MaterialListView(course: course, materialID: self.materialId, pressed: { (id) in
                self.materialId = id
                print("PRESSED")
                self.list!.reload()
                self.getMaterial()
            })
        }
    }
    func getMaterial(){
        HomeRequests.sharedInstance.getMaterial(id: "\(materialId)") { (result) in
            self.material = result
            if self.stackView.arrangedSubviews.count < 2 {
                self.stackView.addArrangedSubview(self.list!)
            }
            self.setData()
            
        }
    }
    
    static func open(vc: UIViewController, courseID: Int, materialId: Int) {
        let viewController = SubjectVC()
        viewController.courseID = courseID
        viewController.materialId = materialId
        if let nav = vc.navigationController {
            nav.pushViewController(viewController, animated: true)
        }
    }
}
