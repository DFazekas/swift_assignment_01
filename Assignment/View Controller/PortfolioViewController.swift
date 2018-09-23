//
//  PortfolioViewController.swift
//  Assignment
//
//  Created by Devon Fazekas on 9/22/18.
//  Copyright © 2018 Devon Fazekas. All rights reserved.
//

import UIKit
import WebKit

class PortfolioViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var webView : WKWebView!
    @IBOutlet var activity : UIActivityIndicatorView!
    
    /////// WebView
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activity.isHidden = false;
        activity.startAnimating();
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.isHidden = true;
        activity.stopAnimating();
    }
//    func webViewDidStartLoad(_ webView: UIWebView) {
//        // Unhide and animate activity indicator for webView pre-load.
//        activity.isHidden = false;
//        activity.startAnimating();
//    }
    
//    func webViewDidFinishLoad(_ webView: UIWebView) {
//        // Hide and stop animating indicator on webView post-load.
//        activity.isHidden = true;
//        activity.stopAnimating();
//    }
    
    /////// Miscellaneous
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load webView.
        //let urlAddress = URL(string: "https://github.com/DFazekas");
        let urlAddress = URL(string: "https://www.projectmkd.com");
        let url = URLRequest(url: urlAddress!);
//        webView?.loadRequest(url as URLRequest);
        webView.load(url);
        webView.navigationDelegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
