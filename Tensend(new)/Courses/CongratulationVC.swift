//
//  CongratulationVC.swift
//  Tensend(new)
//
//  Created by Sultan on 3/11/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy
import Cosmos

class CongratulationVC: UIViewController {

    var courseNameString = ""
    let backIMG = UIImageView()
    let percentIMG = UIImageView()
    var pdfPressed:(()-> Void)? = nil
    let stackView = UIStackView()
    let cosmos = CosmosView()
    var courseId = 0
    let congratLabel = UILabel()
    let courseName = UILabel()
    let forCert = UILabel()
    
    // MARK: - Navigation
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9607843137, blue: 0.9764705882, alpha: 1)
        setImgs()
        congratView()
        
    }
    func congratView(){
        let v = UIView()
        v.backgroundColor = .white
        stackView.setProperties(axis: .vertical, alignment: .center, spacing: 10, distribution: .fill)
        v.addSubview(stackView)
        v.cornerRadius(radius: 10, width: 0)
        view.addSubview(v)
        v.easy.layout(CenterX(),CenterY(), Left(50),Right(50))
        stackView.easy.layout(Edges(15))
        arrangedViews()
    }
    func arrangedViews(){
        
        congratLabel.setProperties(text: "Құттықтаймыз!", font: .systemFont(ofSize: 22, weight: .semibold), textAlignment: .center, numberLines: 1)
        stackView.addArrangedSubview(congratLabel)
        
        
        courseName.setProperties(text: "Сіз <\(self.courseNameString)> курсын тәмәмдадыңыз!", textAlignment: .center, numberLines: 0)
        stackView.addArrangedSubview(courseName)
        
        
        forCert.setProperties(text: "Cертификат алу үшін курсқа баға беріңіз", textAlignment: .center, numberLines: 2)
        stackView.addArrangedSubview(forCert)
        
        cosmos.settings.starMargin = 5
        cosmos.easy.layout(Height(25))
        cosmos.didFinishTouchingCosmos = { rating in
            let param = ["course_id" : self.courseId,
                         "scale" : rating] as [String : Any]
            HomeRequests.sharedInstance.rateCourse(param: param) { (result) in
                if let success = result.success, success {
                    self.rated()
                }
            }
        }
        stackView.addArrangedSubview(cosmos)
    }
    func rated(){
        self.cosmos.isHidden = true
        congratLabel.text = "Сертификат"
        courseName.text = "Курсты аяқтағаныңыз жайлы жеке сертификатыңызды жүктеп алыңыз!"
        
        forCert.textColor = #colorLiteral(red: 0, green: 0.2823529412, blue: 0.8039215686, alpha: 1)
        forCert.attributedText = NSAttributedString(string: "Сертификат жүктеу", attributes:
        [.underlineStyle: NSUnderlineStyle.single.rawValue])
        forCert.addTapGestureRecognizer {
            let url = "https://tensend.me/api/v1/courses/certificate/\(self.courseId)?token=\(UserDefault.getToken())"
            DocReaderVC.open(vc: self, url: url)
        }
    }
    
    // MARK: - Navigation
    func setImgs(){
        self.backIMG.image = #imageLiteral(resourceName: "confetti")
        self.view.addSubview(backIMG)
        backIMG.easy.layout(Edges())
        self.percentIMG.image = #imageLiteral(resourceName: "100")
        self.view.addSubview(percentIMG)
        percentIMG.easy.layout(CenterY(-140),CenterX(),Width(175),Height(192))
    }
    
    // MARK: - Navigation
    static func open(vc: UIViewController,
                     courseId : Int,
                     courseName: String = "",
                     pdfPressed:@escaping (()-> Void) ){
        let receiptVC = CongratulationVC()
        receiptVC.courseId = courseId
        receiptVC.courseNameString = courseName
        receiptVC.pdfPressed = pdfPressed
        if let nav = vc.navigationController {
            nav.pushViewController(receiptVC, animated: true)
        }
    }
}
