//
//  ProfileVC.swift
//  Tensend(new)
//
//  Created by root user on 3/1/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy

class ProfileVC: ScrollStackController {

    let leftView = UIStackView()
    let rightView = UIView()
    let centerView = UIStackView()
    var isLeft = false
    let innerView = UIView()
    let textField = UITextField()
    var link = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 15, distribution: .fill)
        self.setUpView()
        self.getData()
    }
    func getData(){
        let network = NetworkLayer()
        network.getLink { (link) in
            guard let link = link?.link else{
                return
            }
            self.textField.text = link
            self.link = link
        }
    }


}
extension ProfileVC{
    func setUpView(){
        let buttonStackView = UIStackView()
        buttonStackView.setProperties(axis: .horizontal, alignment: .fill, spacing: 0, distribution: .fill)
        buttonStackView.setSpacing(right: 20)
        buttonStackView.addArrangedSubview(UIView())
        let settingsButton = UIButton()
        settingsButton.setImage(#imageLiteral(resourceName: "Exclusion 1"), for: .normal)
        buttonStackView.addArrangedSubview(settingsButton)
        settingsButton.easy.layout(Height(20), Width(20))
        self.stackView.addArrangedSubview(buttonStackView)
        
        let view = UIView()
        let profileImageView = UIImageView()
        profileImageView.image = #imageLiteral(resourceName: "asset-10")
        view.addSubview(profileImageView)
        
        self.stackView.addArrangedSubview(view)
        profileImageView.easy.layout(Height(130), Width(130), CenterX(), Top(), Bottom())
        profileImageView.cornerRadius(radius: 65, width: 5, color: .white)
        
        
        let threeButtons = ThreeButtons(leftPressed: {
            self.innerView.isHidden = true
            self.leftView.isHidden = false
            
        }, rightPressed: {
            
        }, centedPressed: {
            
            self.innerView.isHidden = false
            self.leftView.isHidden = true
            
        })
        self.stackView.addArrangedSubview(threeButtons)
        self.setUpLeftView()
        self.setUpCenterView()
        self.innerView.isHidden = true

    }
    
    
    func setUpLeftView(){
        

            leftView.setProperties(axis: .vertical, alignment: .fill, spacing: 10, distribution: .fill)
            let horSV = UIStackView()
            horSV.setProperties(axis: .horizontal, alignment: .fill, spacing: 10, distribution: .fill)
            let smallView = SmallView(title: "Белсенділік", amount: 10, image: #imageLiteral(resourceName: "purple"))
            let smallView1 = SmallView(title: "Рейтинг", amount: 16, image: #imageLiteral(resourceName: "yellow"))
            horSV.addArrangedSubview(UIView())
            horSV.addArrangedSubview(smallView)
            horSV.addArrangedSubview(smallView1)
            horSV.addArrangedSubview(UIView())

            leftView.addArrangedSubview(horSV)
            
            let horSV1 = UIStackView()
            horSV1.setProperties(axis: .horizontal, alignment: .fill, spacing: 10, distribution: .fill)
            let smallView2 = SmallView(title: "Өткен\nсабақ саны", amount: 10, image: #imageLiteral(resourceName: "red"))
            let smallView3 = SmallView(title: "TENSEND САНЫ", amount: 16, image: #imageLiteral(resourceName: "green"))
            horSV1.addArrangedSubview(UIView())
            horSV1.addArrangedSubview(smallView2)
            horSV1.addArrangedSubview(smallView3)
            horSV1.addArrangedSubview(UIView())

            leftView.addArrangedSubview(horSV1)
            self.stackView.addArrangedSubview(leftView)
            
        
    }
    
    func setUpCenterView(){

            centerView.setProperties(axis: .vertical, alignment: .fill, spacing: 10, distribution: .fill)
            let titleLabel = UILabel()
            titleLabel.text = "САТУ ТРЕНАЖЕРЫ"
            titleLabel.textColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1)
            centerView.addArrangedSubview(titleLabel)
            let textLabel = UILabel()
            textLabel.text = "Сату тренажеры сізге сату қабілетіңізді\nарттыруға және де қосымша табыс тауып,\nTensend ұтыс ойындарына қатысуға\nмүмкіндік береді.\n\nДостарыңызға жіберіңіз немесе жарнамалау\nарқылы ақшалай табыс табыңыз"
            textLabel.numberOfLines = 0
            textLabel.textColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1)
            centerView.addArrangedSubview(textLabel)
            let hSV = UIStackView()
            hSV.setProperties(axis: .horizontal, alignment: .fill, spacing: 0, distribution: .fill)
            textField.isEnabled = false
            textField.textColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1)
            textField.borderStyle = .roundedRect
            textField.backgroundColor = .white
            let button = UIButton()
            button.backgroundColor = #colorLiteral(red: 0, green: 0.3803921569, blue: 0.8901960784, alpha: 1)
            button.setTitleColor(.white, for: .normal)
            button.setTitle("Бөлісу", for: .normal)
            button.addTarget(self, action: #selector(self.share), for: .touchUpInside)
            button.cornerRadius(radius: 7, width: 0)
            hSV.addArrangedSubview(textField)
            hSV.addArrangedSubview(button)
            button.easy.layout(Width(120))
            centerView.addArrangedSubview(hSV)
            innerView.addSubview(centerView)
            centerView.easy.layout(Edges(10))
            self.stackView.addArrangedSubview(innerView)
        
    }
    
    
    @objc func share(){
        UIGraphicsBeginImageContext(view.frame.size)
               view.layer.render(in: UIGraphicsGetCurrentContext()!)
               let image = UIGraphicsGetImageFromCurrentImageContext()
               UIGraphicsEndImageContext()

               let textToShare = "Check out my app"

               if let myWebsite = URL(string: link) {
                   let objectsToShare = [textToShare, myWebsite, image ?? #imageLiteral(resourceName: "app-logo")] as [Any]
                   let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)

                   //Excluded Activities
                   activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
                   

                activityVC.popoverPresentationController?.sourceView = self.view
                   self.present(activityVC, animated: true, completion: nil)
               }
    }
}
