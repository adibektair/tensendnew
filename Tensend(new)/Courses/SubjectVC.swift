//
//  SubjectVC.swift
//  Tensend(new)
//
//  Created by Sultan on 3/1/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import WebKit
import EasyPeasy

class SubjectVC: ScrollStackController, UIWebViewDelegate {
    
    var forMe: ForMe?
    var material: MaterialResponse?
    var courseID = 0
    var materialId = 0
    var list : MaterialListView?
    var materialStackView = UIStackView()
    let materialsStack = UIStackView()
    let materialsLabel = UILabel()
    let titleLabel = UILabel()
    let descLabel = UILabel()
    
    var video : VideoView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.additionalSafeAreaInsets.top = -145
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
            self.materialsStack.removeAllArrangedSubviews()
            self.materialsStack.isHidden = true
            if let docs = m.documents {
                for doc in docs {
                    let img = UIImageView()
                    if let type = doc.type {
                        img.image = UIImage(named: type)
                        self.materialsStack.addArrangedSubview(img)
                        img.easy.layout(Height(41),Width(35))
                    }
                    img.addTapGestureRecognizer {
                        self.docTapped(doc: doc)
                    }
                }
                if !self.materialsStack.arrangedSubviews.isEmpty {
                    materialsStack.addArrangedSubview(UIView())
                    self.materialsLabel.isHidden = false
                    self.materialsStack.isHidden = false
                } else {
                    self.materialsLabel.isHidden = true
                }
            }
            
        }
        
    }
    func docTapped(doc: Document){
        if let url = doc.docPath {
            DocReaderVC.open(vc: self, url: apiImgUrl + url)
        }
    }
    
    func setSubview(){
        
        materialStackView.getProperties(stackView: self.stackView)
        materialStackView.setSpacing(top: 0, left: 31, right: 31, bottom: 0)
        
        titleLabel.setProperties(text: "", font: .systemFont(ofSize: 20, weight: .semibold), numberLines: 2)
        materialStackView.addArrangedSubview(titleLabel)
        
        
        descLabel.setProperties(text: "", font: .systemFont(ofSize: 14), numberLines: 0)
        materialStackView.addArrangedSubview(descLabel)
        
        materialsLabel.isHidden = true
        materialsLabel.setProperties(text: "Қосымша материалдар", font: .systemFont(ofSize: 16, weight: .medium))
        materialStackView.addArrangedSubview(materialsLabel)
        
        
        materialsStack.setProperties(axis: .horizontal, alignment: .leading, spacing: 14, distribution: .fill)
        let docIMG = UIImageView()
        let pdfIMG = UIImageView()
        docIMG.easy.layout(Height(41),Width(36))
        docIMG.image = #imageLiteral(resourceName: "check")
        
        pdfIMG.easy.layout(Height(41),Width(36))
        materialsStack.addArrangedSubview(pdfIMG)
        materialsStack.addArrangedSubview(docIMG)
        materialsStack.addArrangedSubview(UIView())
        materialStackView.addArrangedSubview(materialsStack)
        
        let startButton = UIButton()
        startButton.setTitle("КЕЛЕСІ САБАҚ", for: .normal)
        startButton.backgroundColor = #colorLiteral(red: 0, green: 0.2823529412, blue: 0.8039215686, alpha: 1)
        startButton.cornerRadius(radius: 15, width: 0)
        startButton.easy.layout(Height(58))
        materialStackView.addArrangedSubview(startButton)
        stackView.addArrangedSubview(materialStackView)
        stackView.setSpacing(top: 0, left: 0, right: 0, bottom: 0)
    }
    func getData(){
        HomeRequests.sharedInstance.getCourse(id: "\(courseID)") { (result) in
            self.forMe = result
            if result.courses != nil {
                self.setSubview()
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
            if let v = self.video {
                v.material = result
                v.relod()
            } else {
                self.video = VideoView(parrentVC: self, material: self.material)
                self.stackView.insertArrangedSubview(self.video!, at: 0)
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