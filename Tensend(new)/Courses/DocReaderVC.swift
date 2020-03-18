//
//  DocReaderVC.swift
//  Tensend(new)
//
//  Created by Sultan on 3/5/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import WebKit
import EasyPeasy

class DocReaderVC: UIViewController, UIWebViewDelegate {

    var webView = UIWebView()
    var urlString = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(webView)
        webView.easy.layout(Edges())
        self.additionalSafeAreaInsets.top = -145
        docOpen()
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
    static func open(vc:UIViewController, url: String) {
        let viewController = DocReaderVC()
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
