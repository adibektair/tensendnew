//
//  TabbarViewController.swift
//  Tensend(new)
//
//  Created by Sultan on 2/24/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit

class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeNav = UINavigationController()
        homeNav.addChild(HomeVC())
        self.addChild(homeNav)
        
        let coursesNav = UINavigationController()
        
        coursesNav.addChild(CoursesVC())
        self.addChild(coursesNav)
        
        let meditationNavigationController = UINavigationController()
        let router = MeditationRouter()
        let builder = MeditationBuilder()
        router.navigationController = meditationNavigationController
        router.builder = builder
        router.initialController()
        self.addChild(meditationNavigationController)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
