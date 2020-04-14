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
    let nextLessonButton = UIButton()
    let dateLabel = UILabel()
    let viewsCount = UILabel()
    
    var video : VideoView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.additionalSafeAreaInsets.top = -145
        getData()
        nextLessonButton.addTapGestureRecognizer {
                   self.nextLessonPressed()
//            CongratulationVC.open(vc: self) {
//                print("rated")
//            }
        }
    }
    
    func setData(){
        if let m = material?.material {
            if let title = m.title {
                titleLabel.text = title
            }
            if let desc = m.descriptionField {
                self.descLabel.text = desc
            }
            if let viewsC = m.viewCount {
                self.viewsCount.text = "\(viewsC)"
            }
            if let date = m.createdAt {
                self.dateLabel.text = date
            }
            self.materialsStack.removeAllArrangedSubviews()
//            self.materialsStack.isHidden = true
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
                self.materialsStack.addArrangedSubview(UIView())
                let img = UIImageView()
                img.easy.layout(Height(41),Width(35))
                img.image = #imageLiteral(resourceName: "share")
                materialsStack.addArrangedSubview(img)
                img.addTapGestureRecognizer {
                    self.share()
                }
//                if !self.materialsStack.arrangedSubviews.isEmpty {
//                    materialsStack.addArrangedSubview(UIView())
//                    self.materialsLabel.isHidden = false
//                    self.materialsStack.isHidden = false
//                } else {
//                    self.materialsLabel.isHidden = true
//                }
            }
            
        }
        
    }
    func share(){
        
        NetworkLayer().getLink { (link) in
            guard let link = link?.link else{
                return
            }
            var textToShare = " \(link)"
            if let title = self.material?.material?.title {
                      textToShare = title + textToShare
            }
            if let myWebsite = URL(string: link) {
                let objectsToShare = [textToShare] as [Any]
                let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                
                activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
                activityVC.popoverPresentationController?.sourceView = self.view
                self.present(activityVC, animated: true, completion: nil)
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
        
        titleLabel.setProperties(text: "", font: .systemFont(ofSize: 20, weight: .semibold), numberLines: 0)
        materialStackView.addArrangedSubview(titleLabel)
        
        let infoStackView = UIStackView()
        infoStackView.setProperties(axis: .horizontal, alignment: .fill, spacing: 6, distribution: .fill)
        let timeIcon = UIImageView()
        timeIcon.image = #imageLiteral(resourceName: "time")
        timeIcon.easy.layout(Width(12),Height(12))
        dateLabel.setProperties(text: "", textColor: .lightGray, font: .systemFont(ofSize: 12))
        let stick = UIView()
        stick.easy.layout(Width(1))
        stick.backgroundColor = .gray
        let eyeIcon = UIImageView()
        eyeIcon.easy.layout(Width(15), Height(12))
        eyeIcon.image = #imageLiteral(resourceName: "eye")
        viewsCount.setProperties(text: "", textColor: .lightGray, font: .systemFont(ofSize: 12))
        
        infoStackView.addArrangedSubview(timeIcon)
        infoStackView.addArrangedSubview(dateLabel)
        infoStackView.addArrangedSubview(stick)
        infoStackView.addArrangedSubview(eyeIcon)
        infoStackView.addArrangedSubview(viewsCount)
        infoStackView.addArrangedSubview(UIView())
        materialStackView.addArrangedSubview(infoStackView)
        
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
        
        
        nextLessonButton.setTitle("КЕЛЕСІ САБАҚ", for: .normal)
        nextLessonButton.backgroundColor = #colorLiteral(red: 0, green: 0.2823529412, blue: 0.8039215686, alpha: 1)
        nextLessonButton.cornerRadius(radius: 15, width: 0)
        nextLessonButton.easy.layout(Height(58))
        materialStackView.addArrangedSubview(nextLessonButton)
       
        stackView.addArrangedSubview(materialStackView)
        stackView.setSpacing(top: 0, left: 0, right: 0, bottom: 0)
    }
    func nextLessonPressed(){
        if let l =  self.forMe?.courses?.lessons {
            for i in 0..<l.count {
                if let id = l[i].id, i < l.count - 1, id == self.materialId, l[i].access == true {
                    materialId = l[i + 1].id!
                    self.getMaterial()
                    self.list?.materialID = self.materialId
                    self.list!.reload()
                    break
                } else if let id = l[i].id, i < l.count - 1, id == self.materialId, l[i].access == false  {
                    SubscribeVC.open(vc: self) { (item) in
                        if item != nil {
                            self.view.paymentReq(item: item!)
                        }
                    }
                }
            }
        }
    }
    func getData(){
        HomeRequests.sharedInstance.getCourse(id: "\(courseID)") { (result) in
            self.forMe = result
            if let course = self.forMe?.courses {
                for i in course.lessons! {
                    if i.passed == false && i.id != nil {
                        self.materialId = i.id!
                        break
                    }
                }
                
                self.setSubview()
                self.reload()
                self.getMaterial()
                if let passed = course.lessons?.last?.passed , passed == true {
                    self.nextLessonButton.setTitle("КУРСТЫ АЯҚТАУ", for: .normal)
                    self.nextLessonButton.addTapGestureRecognizer {
                        CongratulationVC.open(vc: self, courseId: self.courseID) {
                            print("PDF kakoito")
                        }
                    }
                }
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
                self.video = VideoView(parrentVC: self, material: self.material, done: { (result) in
                    if let lessons = self.forMe?.courses?.lessons, let i = lessons.firstIndex(where: {$0.id == self.materialId}) {
                        lessons[i].passed = true
                    }
                })
                self.stackView.insertArrangedSubview(self.video!, at: 0)
            }
            self.setData()
        }
    }
    func pay(){
       // https://tensend.me/api/v1/pay?subscription_type_id={id}&token={user_token}
        
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
