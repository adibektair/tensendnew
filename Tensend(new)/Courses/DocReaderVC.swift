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
import Alamofire

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
    func webViewDidFinishLoad(_ webView: UIWebView) {
        if webView.isLoading {
            // still loading
            return
        }
        shareButton()
    }
    
    func shareButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Браузерде ашу", style: .plain, target: self, action: #selector(share(_:)))
    }
    
    @objc func share(_ sender:UIButton) {
        guard let url = URL(string: urlString) else {
            return
        }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

    func getDirectoryPath() ->String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    func sharePdf(path:URL) {
        
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: path.path) {
            let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [path], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
        } else {
            print("document was not found")
            let alertController = UIAlertController(title: "Error", message: "Document was not found!", preferredStyle: .alert)
            let defaultAction = UIAlertAction.init(title: "ok", style: UIAlertAction.Style.default, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    static func open(vc:UIViewController, url: String) {
        let viewController = DocReaderVC()
        viewController.urlString = url
        if let nav = vc.navigationController {
            nav.pushViewController(viewController, animated: true)
        }
    }
    func saveTarget() {
        guard let actionUrl = URL(string: self.urlString) else { return}
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            var documentsURL = FileManager.default.urls(
                for: .documentDirectory,
                in: .userDomainMask
                )[0]
            documentsURL.appendPathComponent("pdfreport")
            return (documentsURL, [.removePreviousFile])
        }
        
        Alamofire.download(
            actionUrl,
            method: .get,
            encoding: JSONEncoding.default,
            headers: nil,
            to: destination
        )
            .responseData(completionHandler: { (response) in
                if let data = response.result.value {
                    let activityViewController = UIActivityViewController(
                        activityItems: [data],
                        applicationActivities: nil
                    )
                    self.present(
                        activityViewController,
                        animated: true,
                        completion: {}
                    )
                }
            })
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
