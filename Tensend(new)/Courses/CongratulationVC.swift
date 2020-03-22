//
//  CongratulationVC.swift
//  Tensend(new)
//
//  Created by Sultan on 3/11/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy

class CongratulationVC: UIViewController {

    let backIMG = UIImageView()
    let percentIMG = UIImageView()
    var pdfPressed:(()-> Void)? = nil
    let stackView = UIStackView()
    
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
        stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 10, distribution: .fill)
        v.addSubview(stackView)
        v.cornerRadius(radius: 10, width: 0)
        view.addSubview(v)
        v.easy.layout(CenterX(),CenterY(), Left(50),Right(50))
        stackView.easy.layout(Edges(15))
        arrangedViews()
    }
    func arrangedViews(){
        let congratLabel = UILabel()
        congratLabel.setProperties(text: "Құттықтаймыз!", font: .systemFont(ofSize: 22, weight: .semibold), textAlignment: .center, numberLines: 1)
        stackView.addArrangedSubview(congratLabel)
        
        let courseName = UILabel()
        courseName.setProperties(text: "Сіз «Сымбатты мүсін» курсын тәмамдадыңыз!", textAlignment: .center, numberLines: 2)
        stackView.addArrangedSubview(courseName)
        
        let forCert = UILabel()
        forCert.setProperties(text: "Cертификат алу үшін курсқа баға беріңіз", textAlignment: .center, numberLines: 2)
        stackView.addArrangedSubview(forCert)
        
        let rateView = UIView()
        rateView.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        rateView.easy.layout(Height(25))
        rateView.addTapGestureRecognizer {
            if self.pdfPressed != nil {
                self.dismiss(animated: true) {
                    self.pdfPressed!()
                }
            }
        }
        stackView.addArrangedSubview(rateView)
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
    static func open(vc: UIViewController, pdfPressed:@escaping (()-> Void) ){
        let receiptVC = CongratulationVC()
        receiptVC.pdfPressed = pdfPressed
        if let nav = vc.navigationController {
            nav.pushViewController(receiptVC, animated: true)
        }
    }
}
