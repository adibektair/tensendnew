//
//  MeditationsView.swift
//  Tensend(new)
//
//  Created by root user on 2/24/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy
import SDWebImage

class MeditationsView: ScrollStackController, UICollectionViewDelegate, UICollectionViewDataSource {

    var presenter : MeditationPresenterProtocol?
    let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: UICollectionViewFlowLayout.init())
    let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    let moreButton = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeNCTranslucent()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "MeditationCVC", bundle: nil), forCellWithReuseIdentifier: "cell")
        
       
        
    }
    


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MeditationCVC
        cell.img.sd_setImage(with: URL(string: apiImgUrl + (self.presenter?.meditations?[0].imagePath?.encodeUrl ?? "") ), completed: nil)
        cell.img.contentMode = .scaleAspectFill
        cell.title.text = self.presenter?.meditations?[0].title ?? ""
        cell.time.text = self.presenter?.meditations?[0].descriptionField ?? ""
        print("img url " + (self.presenter?.meditations?[0].imagePath ?? "") )
        return cell
    }
    
}
extension MeditationsView: UICollectionViewDelegateFlowLayout{
    func setViews(){
        let section = SectionsName()
        section.setData(title: "БҮГІНГІ МЕДИТАЦИЯ", desc: "Күнделікті медитация жасауды ұмытпаңыз")
        stackView.addArrangedSubview(section)
        stackView.addArrangedSubview(collectionView)
        self.collectionView.reloadData()
        collectionView.backgroundColor = .clear
        collectionView.easy.layout(Left(30), Right(30), Height(186))
        guard let count = self.presenter?.meditations?.count else {
            return
        }
        for i in 0...count - 1{
            let eachView = MeditationEachView()
            eachView.imageView.sd_setImage(with: URL(string: apiImgUrl + (self.presenter?.meditations?[i].imagePath ?? "") ), completed: nil)
            eachView.titleLabel.text = self.presenter?.meditations?[i].title ?? ""
            eachView.timeLabel.text = self.presenter?.meditations?[i].descriptionField ?? ""
            stackView.addArrangedSubview(eachView)
            eachView.easy.layout(Height(71) , Left(30), Right(30))
            eachView.cornerRadius(radius: 15, width: 0)
            eachView.tag = self.presenter?.meditations?[i].id ?? 0
            eachView.imageView.contentMode = .scaleAspectFill
            eachView.addTapGestureRecognizer {
                self.goToSingle(eachView)
            }
        }

        moreButton.addBorder(toSide: .Bottom, withColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), andThickness: 1)
        moreButton.setTitle("БАРЛЫҒЫ", for: .normal)
        moreButton.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
        stackView.addArrangedSubview(moreButton)
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.collectionView.layer.frame.size
    }
    @objc func goToSingle(_ sender : UIView){
        self.presenter?.goToSingle(id: sender.tag)
    }
}
extension MeditationsView : MeditationProtocol{
    
    func gotMeditations() {
        self.setViews()
    }
    
}
