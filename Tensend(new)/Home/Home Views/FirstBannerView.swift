//
//  FirstBannerView.swift
//  Tensend
//
//  Created by Sultan on 1/28/20.
//  Copyright © 2020 Sultan. All rights reserved.
//

import UIKit
import EasyPeasy

class FirstBannerView: UIView,UICollectionViewDelegate {
    
    //    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
    let stackView = UIStackView()
    private var pageControl = UIPageControl(frame: .zero)
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
        cv.register(OnlyImageCVC.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = .clear
        cv.isScrollEnabled = true
        cv.isPagingEnabled = true
        return cv
    }()
    
    private var indexOfCellBeforeDragging = 0
    lazy var pagecontroll = UIPageControl()
    var colors = [#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1),#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)]
    var color = #imageLiteral(resourceName: "Снимок экрана -3")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sizes()
        setupPageControl()
    }
    
    func sizes(){
        self.addSubview(collectionView)
        collectionView.easy.layout(Edges(),Height(200),Bottom(30))
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension FirstBannerView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func life(){
        //         collectionView.register(OnlyImageCVC.self, forCellWithReuseIdentifier: "OnlyImageCVC")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OnlyImageCVC
        cell.layer.cornerRadius = 8
        cell.image.image = #imageLiteral(resourceName: "grit")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 60
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        let s = CGSize(width: size.width - 60, height: 187)
        return s
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapped \(indexPath.row)")
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        self.pageControl.currentPage = indexPath.row
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if scrollView == collectionView {
            perform(#selector(self.actionOnFinishedScrolling), with: nil, afterDelay: 0.01)
        }
    }
    
    @objc func actionOnFinishedScrolling() {
        let x = collectionView.contentOffset.x
        let w = collectionView.bounds.size.width
        let currentPage = Int(ceil(x/w))
        if currentPage < 0 || currentPage >= self.pageControl.numberOfPages {
            print("Не могу currentPage = \(currentPage)")
            return
        }
        changePageControl(currentPage: currentPage)
    }
    func changePageControl(currentPage:Int) {
        self.pageControl.currentPage = currentPage
    }
}

extension FirstBannerView {
    func setupPageControl() {
        pageControl.numberOfPages = 4
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0, green: 0.2823529412, blue: 0.8039215686, alpha: 1)
        pageControl.subviews.forEach { (a) in
            a.layer.borderWidth = 0.5
            a.layer.borderColor = UIColor.white.cgColor
            a.layer.cornerRadius = a.frame.height / 2
        }
        pageControl.pageIndicatorTintColor = .white
        pageControl.isEnabled = false
        let leading = NSLayoutConstraint(item: pageControl, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        let trailing = NSLayoutConstraint(item: pageControl, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)
        let bottom = NSLayoutConstraint(item: pageControl, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        
        self.insertSubview(pageControl, at: 0)
        self.bringSubviewToFront(pageControl)
        self.addConstraints([leading, trailing, bottom])
        pageControl.easy.layout(Height(20))
    }
}
