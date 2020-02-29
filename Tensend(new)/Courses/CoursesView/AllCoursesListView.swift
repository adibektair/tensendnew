//
//  AllCoursesListView.swift
//  Tensend(new)
//
//  Created by Sultan on 2/23/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy

class AllCoursesListView: UIView {
    
    var categories : CategoriesResponse?
    var parrentVC = UIViewController()
    var stackView = UIStackView()
    var count = 15
    let tableView = UITableView()
    init(parrentVC: UIViewController) {
        super.init(frame: .zero)
        self.parrentVC = parrentVC
        setViewws()
        getData()
    }
    
    func setViewws(){
        self.addSubview(stackView)
        stackView.easy.layout(Edges())
        stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 10, distribution: .fill)
        
        
    }
    func tableViewDelegate(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        stackView.addArrangedSubview(tableView)
        tableView.easy.layout(Height(400))
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
    }
    override func layoutIfNeeded() {
        let height = tableView.contentSize.height
        tableView.easy.layout(Height(height))
    }
    override func layoutSubviews() {
        let height = tableView.contentSize.height
        tableView.easy.layout(Height(height))
    }
    func each(){
        if let count = categories?.categories?.data?.count {
            self.count = count
        }
        if (self.parrentVC as? CoursesVC) != nil && self.count > 0 && self.count >= 3 {
            count = 3
        }
        for i in 0..<self.count {
            let data = self.categories!.categories!.data![i]
            let v = IconWithTitleView(parrentVC: self.parrentVC, data: data)
            v.addTapGestureRecognizer {
                CoursesByCategoryVC.open(vc: self.parrentVC, id: data.id!)
            }
            v.dropShadowBlue()
            stackView.addArrangedSubview(v)
        }
        if (self.parrentVC as? CoursesVC) != nil {
            self.allButton()
        }
    }
    func allButton(){
        let allButton = UIButton()
        allButton.setTitle("Барлығы", for: .normal)
        allButton.titleLabel?.textAlignment = .center
        allButton.titleLabel?.font = .systemFont(ofSize: 14)
        allButton.setTitleColor(.gray, for: .normal)
        allButton.addTapGestureRecognizer {
            CoursesListVC.open(vc: self.parrentVC)
        }
        stackView.addArrangedSubview(allButton)
    }
    func getData(){
        HomeRequests.sharedInstance.getCategories(page: 0) { (result) in
            self.categories = result
            if (self.parrentVC as? CoursesVC) != nil {
                self.each()
            } else {
                self.tableViewDelegate()
            }
            
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension AllCoursesListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = self.categories?.categories?.data?.count {
            return count
        }
        return 0
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if let data = self.categories?.categories?.data?[indexPath.row] {
            let v = IconWithTitleView(parrentVC: self.parrentVC, data: data)
            cell.addSubview(v)
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            v.easy.layout(Left(1),Right(1),Top(10),Bottom(10))
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let d = self.categories?.categories?.data?[indexPath.row], let id = d.id {
            CoursesByCategoryVC.open(vc: self.parrentVC, id: id)
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if let datas = self.categories?.categories?.data{
            if indexPath.row == datas.count - 1 {
                self.categories?.categories!.loadNextPage {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

