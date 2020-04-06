//
//  SettingsVC.swift
//  Tensend(new)
//
//  Created by root user on 3/9/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    let titles = ["Жеке ақпарат", "Төлемдер мен табыс", "Құпия сөз", "Менің сертификаттарым", "Сұрақ/Жауап"]
    let images : [UIImage] = [#imageLiteral(resourceName: "Screen Shot 2020-03-11 at 9.00.28 PM"), #imageLiteral(resourceName: "paymts"), #imageLiteral(resourceName: "pw"), #imageLiteral(resourceName: "cert"), #imageLiteral(resourceName: "faq")]
    
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTVC", for: indexPath) as! SettingsTVC
        cell.titleLabel.text = titles[indexPath.section]
        cell.logoImageView.image = images[indexPath.section]
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            ProfileSettingsVC.open(vc: self)
        }
        else if indexPath.section == 1{
            CashoutGoVC.open(vc: self)
        }
        else if indexPath.section == 2{
            ChangePasswordVC.open(vc: self)
        }
        else if indexPath.section == 3{
            MyCertificatesVC.open(vc: self)
        }
        else if indexPath.section == 4{
            FAQViewController.open(vc: self)
        }
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }

    static func open(vc: UIViewController) {
        let viewController = self.init()
        if let nav = vc.navigationController {
            nav.pushViewController(viewController, animated: true)
        }
    }
    
}
