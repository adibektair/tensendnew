//
//  TabbarViewController.swift
//  Tensend(new)
//
//  Created by Sultan on 2/24/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import AVKit

class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
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
        let icon3 = UITabBarItem(title: "Медитация", image: #imageLiteral(resourceName: "meditationTab"), selectedImage: #imageLiteral(resourceName: "meditationTab"))
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
        self.tabBar.barTintColor = UIColor.white
        
        do {
           try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch(let error) {
            print(error.localizedDescription)
        }
        NotificationCenter.default.addObserver(
        self,
        selector: #selector(unauthorized(notification:)),
        name: NSNotification.Name(rawValue: "unauthorized"),
        object: nil)
    }
    
    @objc func unauthorized(notification: NSNotification) {
        unauthorizedCase()
    }
    
    func unauthorizedCase(){
            let navigationController = UINavigationController()
            navigationController.navigationBar.isTranslucent = true
             let builder = AssemblyModuleBuilder()
             let router = Router(navController: navigationController, assemblyProtocol: builder)
             let mainViewController = builder.createAuthModule(router: router)
             navigationController.viewControllers = [mainViewController]
             navigationController.modalPresentationStyle = .fullScreen
             UserDefault.clear()
             self.present(navigationController, animated: true, completion: nil)
    }
   

}
