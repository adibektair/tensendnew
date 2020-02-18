//
//  SignInView.swift
//  Tensend(new)
//
//  Created by root user on 2/18/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy

class SignInView: ScrollStackController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createTopView()
        
    }



}
extension SignInView{
    func createTopView(){
        let view = UIView()
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "Монтажная область -1")
        view.addSubview(image)
        image.easy.layout(Top(), Bottom(), Left(), Right())
        let logoImageView = UIImageView()
        logoImageView.image = #imageLiteral(resourceName: "Path 10")
        view.addSubview(logoImageView)
        logoImageView.easy.layout(Center(), Height(81), Width(105))
        let label = UILabel()
        label.text = "Tensend"
        label.textColor = .white
        view.addSubview(label)
        label.easy.layout(Top(10).to(logoImageView), CenterX().to(logoImageView))
        stackView.addArrangedSubview(view)
        view.easy.layout(Top(), Left(), Right(), Height(UIScreen.main.bounds.height * 0.33))
    }
    
    func createMiddleView(){
        let view = UIView()
        let label = UILabel()
        label.text = "Аккаунтыңызға кіріңіз"
        label.font = UIFont(name: "Montserrat-Regular", size: 20)
        label.textColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1)
        view.addSubview(label)
//        label.easy.layout(Top(50), CenterX(), )
    }
}
