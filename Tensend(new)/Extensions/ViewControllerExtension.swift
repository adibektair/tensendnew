//
//  ViewControllerExtension.swift
//  Tensend
//
//  Created by Sultan on 1/26/20.
//  Copyright © 2020 Sultan. All rights reserved.
//

import UIKit
import EasyPeasy
extension UIViewController {
    func makeNCTranslucent(){
        self.additionalSafeAreaInsets.top = -145
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) 
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        let textAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func setBackButton(named: String = "") {
           let backItem = UIBarButtonItem()
           backItem.title = named
           navigationItem.backBarButtonItem = backItem
       }
}
