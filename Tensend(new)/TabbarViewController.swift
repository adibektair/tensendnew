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
        var controllers = [UIViewController]()
        let icon1 = UITabBarItem(title: "Басты бет", image: UIImage(named: "home.png"), selectedImage: #imageLiteral(resourceName: "home"))
        
        let homeNav = UINavigationController()
        homeNav.addChild(HomeVC())
        homeNav.tabBarItem = icon1
        controllers.append(homeNav)
        
        
        let coursesNav = UINavigationController()
        let icon2 = UITabBarItem(title: "Курстар", image: #imageLiteral(resourceName: "coursesTab"), selectedImage: #imageLiteral(resourceName: "coursesTab"))
        coursesNav.addChild(CoursesVC())
        coursesNav.tabBarItem = icon2
        controllers.append(coursesNav)
        
        let meditationNavigationController = UINavigationController()
        let router = MeditationRouter()
        let builder = MeditationBuilder()
        router.navigationController = meditationNavigationController
        router.builder = builder
        router.initialController()
        let icon3 = UITabBarItem(title: "Медитация", image: #imageLiteral(resourceName: "coursesTab"), selectedImage: #imageLiteral(resourceName: "coursesTab"))
        meditationNavigationController.tabBarItem = icon3
        controllers.append(meditationNavigationController)
     
        let profileNav = UINavigationController()
        let profileVC = ProfileVC()
        profileNav.addChild(profileVC)
        let icon4 = UITabBarItem(title: "Профиль", image: #imageLiteral(resourceName: "profileTab"), selectedImage: #imageLiteral(resourceName: "profileTab"))
        profileNav.tabBarItem = icon4
        controllers.append(profileNav)
        
        self.tabBar.tintColor = #colorLiteral(red: 0, green: 0.2823529412, blue: 0.8039215686, alpha: 1)
        self.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1)
        self.viewControllers = controllers
        
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
