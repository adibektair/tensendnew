//
//  BestCourses.swift
//  Tensend(new)
//
//  Created by Sultan on 2/22/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy

class BestCourses: UIView {

    var parrentVC = UIViewController()
    lazy var collectionView : UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 13, right: 0)
        layout.itemSize = CGSize(width: self.frame.width, height: self.frame.height)
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        //If you set it false, you have to add constraints.
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.showsHorizontalScrollIndicator = false
             cv.register(UINib(nibName: "ForYouCVC", bundle: nil), forCellWithReuseIdentifier: "ForYouCVC")
        cv.backgroundColor = .clear
        cv.isScrollEnabled = true
        return cv
    }()
    
    init(parrentVC: UIViewController) {
        super.init(frame: .zero)
        self.parrentVC = parrentVC
        self.addSubview(collectionView)
        collectionView.easy.layout(Edges(),Height(218))
    }
    
    private func setCollectionView(){
        let view = ForYouCVC(frame: .zero)
        view.awakeFromNib()
        self.addSubview(view)
        view.img.image = #imageLiteral(resourceName: "Снимок экрана -4")
        view.ava.image = #imageLiteral(resourceName: "Снимок экрана -5")
        view.easy.layout(Edges(),Height(218))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension BestCourses: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ForYouCVC", for: indexPath) as! ForYouCVC
        cell.img.image = #imageLiteral(resourceName: "Снимок экрана -4")
        cell.ava.image = #imageLiteral(resourceName: "Снимок экрана -5")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let size = collectionView.frame.size
            let s = CGSize(width: size.width, height: 218)
            return s
    }
}
