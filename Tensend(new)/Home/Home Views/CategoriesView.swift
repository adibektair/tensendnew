//
//  CategoriesView.swift
//  Tensend
//
//  Created by Sultan on 1/28/20.
//  Copyright © 2020 Sultan. All rights reserved.
//

import UIKit
import EasyPeasy
class CategoriesView: UIView {
    
    var categories : CategoriesResponse?
    
    lazy var collectionView : UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        layout.itemSize = CGSize(width: self.frame.width, height: self.frame.height)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        //If you set it false, you have to add constraints.
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(UINib(nibName: "ImagesWithTitleCVC", bundle: nil), forCellWithReuseIdentifier: "ImagesWithTitleCVC")
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear
        cv.isScrollEnabled = true
        return cv
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(collectionView)
        collectionView.easy.layout(Edges(),Height(100))
        getData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func getData(){
        HomeRequests.sharedInstance.getCategories(page: 0) { (result) in
            self.categories = result
            self.collectionView.reloadData()
        }
    }
}
extension CategoriesView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        if let count = categories?.categories?.data?.count, count > 0 {
            self.isHidden = false
            return count
        }
        self.isHidden = true
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImagesWithTitleCVC", for: indexPath) as! ImagesWithTitleCVC
        if let data = self.categories?.categories?.data?[indexPath.row] {
            cell.categoryData = data
            if indexPath.row == self.categories!.categories!.data!.count - 1 {
                self.categories!.categories!.loadNextPage {
                    self.collectionView.reloadData()
                }
            }
        }
        
        print("indexpath row = \(indexPath.row)")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.parentViewController != nil {
            if let data = self.categories?.categories?.data?[indexPath.row], let id = data.id {
                CoursesByCategoryVC.open(vc: self.parentViewController!, id: id)
            }
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 58, height: 100)
    }
    
    
}
