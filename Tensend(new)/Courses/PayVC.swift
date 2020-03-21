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

class PayVC: UIViewController,UIWebViewDelegate {

    var webView = UIWebView()
    var urlString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        self.view.addSubview(webView)
        webView.easy.layout(Edges())
//        self.additionalSafeAreaInsets.top = -100
        docOpen()
        close()
    }
    
    func docOpen(){
        if let docUrl = URL(string: self.urlString.encodeUrl) {
            let req = NSURLRequest(url: docUrl)
            webView.delegate = self
            webView.scalesPageToFit = true
            webView.contentMode = .scaleAspectFit
            webView.loadRequest(req as URLRequest)
        }
    }
    func setSize(){
        self.view.addSubview(webView)
        webView.easy.layout(Edges())

        webView.contentMode = .scaleAspectFit
    }

    func close() {
        let closebutton = UIButton()
        closebutton.setTitle("Жабу", for: .normal)
        closebutton.setTitleColor( #colorLiteral(red: 0, green: 0.2823529412, blue: 0.8039215686, alpha: 1), for: .normal)
        self.view.addSubview(closebutton)
        closebutton.easy.layout(Right(12),Top(64))
        closebutton.addTapGestureRecognizer {
            let tab = TabbarViewController()
            tab.modalPresentationStyle = .fullScreen
            self.present(tab, animated: true, completion: nil)
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
