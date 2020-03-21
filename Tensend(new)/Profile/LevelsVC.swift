//
//  LevelsVC.swift
//  Tensend(new)
//
//  Created by root user on 3/21/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy

class LevelsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var levels = [Level]()
    var id = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "LevelTVC", bundle: nil), forCellReuseIdentifier: "LevelTVC")
        self.makeNCTranslucent()
        self.title = "Деңгейлер"
        self.view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9607843137, blue: 0.9764705882, alpha: 1)
        self.tableView.backgroundColor = .clear
        self.tableView.allowsSelection = false
        self.tableView.contentInset = UIEdgeInsets(top: -22, left: 0, bottom: 0, right: 0)

    }

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var top: NSLayoutConstraint!{
        didSet{
            self.top.constant = self.navigationController!.navigationBar.frame.height
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LevelTVC", for: indexPath) as! LevelTVC
        cell.myId = id
        cell.level = levels[indexPath.section]
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = true
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.levels.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 22
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section != 0{
            let view = UIView()
            let imageView = UIImageView()
            imageView.image = #imageLiteral(resourceName: "Screen Shot 2020-03-21 at 1.41.34 AM")
            view.addSubview(imageView)
            imageView.easy.layout(Top(5), Bottom(5), Width(15), CenterX())
            imageView.contentMode = .scaleAspectFill
            return view
        }
        return UIView()

    }
    static func open(vc: UIViewController, levels : [Level], id : Int) {
        let viewController = self.init()
        viewController.id = id
        viewController.levels = levels
        if let nav = vc.navigationController {
            nav.pushViewController(viewController, animated: true)
        }
    }
}
