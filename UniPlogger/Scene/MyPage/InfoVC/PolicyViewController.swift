//
//  PolicyViewController.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/25.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit
import WebKit

class PolicyViewController: InfoBaseViewController, WKNavigationDelegate, WKUIDelegate {
  
    var webView: WKWebView!
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

    override func loadView() {
        super.loadView()
        
        let contentController = WKUserContentController()
        let config = WKWebViewConfiguration()
        
        let userScript = WKUserScript(source: "redHeader()", injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        contentController.addUserScript(userScript)
        config.userContentController = contentController
        
        webView = WKWebView(frame: self.view.bounds, configuration: config)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        
        self.view.addSubview(webView)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = Bundle.main.url(forResource: "policy", withExtension: "html")
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    @available(iOS 8.0, *)
    public func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Swift.Void){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let otherAction = UIAlertAction(title: "OK", style: .default, handler: {action in completionHandler()})
        alert.addAction(otherAction)
            
        self.present(alert, animated: true, completion: nil)
    }
    
}
