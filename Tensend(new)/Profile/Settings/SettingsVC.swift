//
//  SettingsVC.swift
//  Tensend(new)
//
//  Created by root user on 3/9/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    let titles = ["Жеке ақпарат" , "Құпия сөз"]
    let images : [UIImage] = [#imageLiteral(resourceName: "Screen Shot 2020-03-11 at 9.00.28 PM"), #imageLiteral(resourceName: "pwset")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Баптаулар"
        self.makeNCTranslucent()
        self.view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9607843137, blue: 0.9764705882, alpha: 1)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "SettingsTVC", bundle: nil), forCellReuseIdentifier: "SettingsTVC")
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = .clear
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
    }

    
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!{
        didSet{
            self.topConstraint.constant = self.navigationController?.navigationBar.frame.height ?? 0
        }
    }
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTVC", for: indexPath) as! SettingsTVC
        cell.titleLabel.text = titles[indexPath.row]
        cell.logoImageView.image = images[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            ProfileSettingsVC.open(vc: self)
        }else if indexPath.row == 1{
            CashoutGoVC.open(vc: self)
        }
        
    }

    static func open(vc: UIViewController) {
        let viewController = self.init()
        if let nav = vc.navigationController {
            nav.pushViewController(viewController, animated: true)
        }
    }
    
}
