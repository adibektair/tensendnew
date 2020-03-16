//
//  PayVC.swift
//  Tensend(new)
//
//  Created by Sultan on 3/15/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import WebKit
import EasyPeasy

class PayVC: UIViewController {

    let webView = WKWebView()
    var urlString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setSize()
        loadWeb()
    }
    
    func setSize(){
        self.view.addSubview(webView)
        webView.easy.layout(Edges())

        webView.contentMode = .scaleAspectFit
    }
    func loadWeb() {
        
        if let link = URL(string: urlString) {
            let request = URLRequest(url: link)
            webView.load(request)
        }

    }
    func pay(){
         
    }

    static func open(vc:UIViewController, url: String) {
        let viewController = PayVC()
        viewController.urlString = url
        if let nav = vc.navigationController {
            nav.pushViewController(viewController, animated: true)
        }
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
