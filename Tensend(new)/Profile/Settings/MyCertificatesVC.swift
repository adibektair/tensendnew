//
//  MyCertificatesVC.swift
//  Tensend(new)
//
//  Created by root user on 4/1/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy

class MyCertificatesVC: ScrollStackController {

    let networkLayer = NetworkLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeNCTranslucent()
        self.title = "Менің сертификаттарым"
        self.networkLayer.getCertificates { (result) in
            if let certificates = result?.certificates{
                self.setViews(certificates: certificates)
                return
            }
            Helper.shared().makeUserResponse(response: result!) { (success, text) in
                self.showAlert(title: success, message: text)
            }
        }
    }
    

    func setViews(certificates : [DataObject]){
        self.stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 15, distribution: .fill)
        if certificates.count == 0{
            let infoView = InfoTextView(title: "Әзірше сертификаттарыңыз жоқ")
            self.stackView.addArrangedSubview(infoView)
        }else{
            let infoView = InfoTextView(title: "Бұл бөлімде сіз курстарды аяқтағаныңызды\nрастайтын сертификаттарды телефоныңызға\nжүктеп, немеcе электродны поштаңызға\nжібере аласыз.")
            self.stackView.addArrangedSubview(infoView)
        }
        
        for i in 0..<certificates.count {
            let view = UIView()
            let data = certificates[i]
            let a = EachCourse(data: data)
            a.cornerRadius(radius: 8, width: 0)
            a.addTapGestureRecognizer {
                let url = "https://tensend.me/api/v1/courses/certificate/\(certificates[i].id!)?token=\(UserDefault.getToken())"
                DocReaderVC.open(vc: self, url: url)
            }
            view.addSubview(a)
            a.easy.layout(Edges(10))
            self.stackView.addArrangedSubview(view)
        }
        
    }
    
    static func open(vc: UIViewController) {
        let viewController = self.init()
        if let nav = vc.navigationController {
            nav.pushViewController(viewController, animated: true)
        }
    }
   
}
