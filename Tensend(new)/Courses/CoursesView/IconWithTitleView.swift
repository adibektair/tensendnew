//
//  IconWithTitleView.swift
//  Tensend(new)
//
//  Created by Sultan on 2/23/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy

class IconWithTitleView: UIView {
    var data : DataObject?
    var parrentVC = UIViewController()
    var stackView = UIStackView()
    
    init(parrentVC: UIViewController, data: DataObject) {
        super.init(frame: .zero)
        self.parrentVC = parrentVC
        self.data = data
        setViewws()
    }
    
    func setViewws(){
        self.easy.layout(Height(71))
        self.backgroundColor = .white
        dropShadowBlue()
        self.cornerRadius(radius: 15, width: 0)
        addSubview(stackView)
        self.dropShadowBlue()
        stackView.easy.layout(Bottom(),Top(),Left(8),Right(8))
        stackView.setProperties(axis: .horizontal, alignment: .center, spacing: 16, distribution: .fill)
        arrangedSubviews()
    }
    
    func arrangedSubviews(){
        let viewForIcon = UIView()
        viewForIcon.backgroundColor = #colorLiteral(red: 0, green: 0.2823529412, blue: 0.8039215686, alpha: 1)
        let icon = UIImageView()
        icon.image = #imageLiteral(resourceName: "Path 10")
        if let img = data?.imgPath, let url = URL(string: apiImgUrl + img.encodeUrl) {
            icon.sd_setImage(with: url, completed: nil)
        }
        viewForIcon.addSubview(icon)
        icon.contentMode = .scaleAspectFit
        icon.easy.layout(CenterX(),CenterY(),Height(30),Width(30),Top(),Bottom())
        viewForIcon.easy.layout(Height(58),Width(58))
        viewForIcon.cornerRadius(radius: 29, width: 2, color: #colorLiteral(red: 0.7294117647, green: 0.7921568627, blue: 0.9490196078, alpha: 1))
        stackView.addArrangedSubview(viewForIcon)
        
        let stickContainer = UIView()
        let stick = UIView()
        stickContainer.addSubview(stick)
        stick.backgroundColor = .gray
        stick.easy.layout(Width(1),Height(39),CenterY(),Left(),Right())
        stackView.addArrangedSubview(stickContainer)
        
        let title = UILabel()
        title.setProperties(text: "Маркетинг", textColor: .black, textAlignment: .left, numberLines: 1)
        if let name = data?.name  {
            title.text = name
        }
        stackView.addArrangedSubview(title)
        
        let arrowContainer = UIView()
        let arrow = UIImageView()
        arrow.easy.layout(Width(10),Height(10))
        arrow.image = #imageLiteral(resourceName: "Arrow")
        arrow.contentMode = .scaleAspectFit
        arrowContainer.addSubview(arrow)
        arrow.easy.layout(CenterX(),CenterY(),Height(10),Width(10),Left(),Right())
        
        stackView.addArrangedSubview(arrow)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
