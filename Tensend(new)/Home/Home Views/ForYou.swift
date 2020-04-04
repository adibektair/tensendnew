//
//  ForYou.swift
//  Tensend
//
//  Created by Sultan on 2/3/20.
//  Copyright © 2020 Sultan. All rights reserved.
//

import UIKit
import EasyPeasy

class ForYou: UIView {
    
    var object : ForMe?
    
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
        cv.register(UINib(nibName: "ForYouCVC", bundle: nil), forCellWithReuseIdentifier: "ForYouCVC")
        cv.backgroundColor = .clear
        cv.isScrollEnabled = true
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(collectionView)
        collectionView.easy.layout(Edges(),Height(218))
        getData()
        
    }
    func getData(){
        HomeRequests.sharedInstance.getForMe(page: 0) { (result) in
            self.object = result
            self.collectionView.reloadData()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ForYou: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = object?.courses?.data?.count, count > 0 {
            self.isHidden = false
            return count
        }
        self.isHidden = true
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ForYouCVC", for: indexPath) as! ForYouCVC
        if let data = self.object?.courses?.data?[indexPath.row] {
            cell.data = data
            if indexPath.row == self.object!.courses!.data!.count - 1 {
                self.object!.courses!.loadNextPage {
                    self.collectionView.reloadData()
                }
            }
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let parrentVC = self.parentViewController else { return }
        guard let data = self.object?.courses?.data?[indexPath.row] else { return }
        if let id = data.id {
            let started = data.started ?? false
            AboutCourseVC.open(vc: parrentVC,id: id,started: started)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        let s = CGSize(width: size.width - 60, height: 218)
        return s
    }
}

