//
//  Meditation.swift
//  Tensend
//
//  Created by Sultan on 2/10/20.
//  Copyright © 2020 Sultan. All rights reserved.
//

import UIKit
import EasyPeasy
class Meditation: UIView {
    
    lazy var collectionView : UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 13, right: 30)
        layout.itemSize = CGSize(width: self.frame.width, height: self.frame.height)
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        //If you set it false, you have to add constraints.
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.showsHorizontalScrollIndicator = false
        cv.register(UINib(nibName: "MeditationCVC", bundle: nil), forCellWithReuseIdentifier: "MeditationCVC")
        cv.backgroundColor = .clear
        cv.isScrollEnabled = true

        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        collectionView.easy.layout(Edges(),Height(150))
    }
   


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Meditation: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeditationCVC", for: indexPath) as! MeditationCVC
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 166, height: 150)
    }
    
}
