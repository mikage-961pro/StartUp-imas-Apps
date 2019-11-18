//
//  ViewController.swift
//  St@rtline
//
//  Created by Apple on 2019/08/23.
//  Copyright © 2019 Apple.inc All rights reserved.
//

import Cocoa
import WebKit
import SwiftUI

class ViewController: NSViewController {
 
    
    @IBOutlet var miku_web_clock: WKWebView!
    @IBOutlet weak var WebView: WKWebView!
    var cookies = Dictionary<String,String>()
    
    var webView: WKWebView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://million.765pro-theater.com/miku/"
        var request = URLRequest(url: URL(string: url)!)
        print("Request:OK")
        
        var httpcookies = [HTTPCookie]()
         for (key, value) in cookies {
            httpcookies.append(ViewController.makeCookie(key: key, value: value))
        }
        let headers = HTTPCookie.requestHeaderFields(with: httpcookies)
        for (name, value) in headers {
            request.addValue(value, forHTTPHeaderField: name)
            print("Made HTTPCookie")
        }
        
        WebView.load(request)
        
    
        let cookies = HTTPCookieStorage.shared.cookies ?? []
        for (cookie) in cookies {
            WebView.configuration.websiteDataStore.httpCookieStore.setCookie(cookie)
            print("Set Cookie OK")
        }
        
        // Do any additional setup after loading the view.
        
        func webView(_ WebView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
            guard let url = navigationAction.request.url else {
                return nil
            }

            guard let targetFrame = navigationAction.targetFrame, targetFrame.isMainFrame else {
                WebView.load(URLRequest(url: url))
                return nil
            }
            return nil
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
                print("ここは反応する")
            }
        //    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        //        decisionHandler(.allow)
        //    }
            func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
                print("ここも反応")
                print(webView.url?.absoluteString as Any)
        // Optional("http://www.jp.playstation.com/ps4/")
            }
            func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {

                print("ここは無反応")
            }
    }
    
    
     

     

    
    class func makeCookie(key:String, value:String) -> HTTPCookie{
        let cookies = HTTPCookie(properties: [
            .domain: "shinycolors.enza.fun",
            .path: "/",
            .name: key,
            .value: value,
            .secure: "FALSE",
            .expires: NSDate(timeIntervalSinceNow: 31556926)
            ])!
        return cookies
      
    }
    
    func webView(_ WebView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        let e = error as NSError

        if e.code == -1009 {
            print("NotConnectedToInternet")
        }else{
            print("デバッグコメント：それ以外の問題か開通成功")
        }
    }
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration,
                 for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {

        if navigationAction.targetFrame == nil {
            webView.load(navigationAction.request)
        }

        return nil
    }

    
    
 


    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    

}
// target=_blank対策
//extension ViewController: WKUIDelegate {
//
//    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration,
//                 for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
//
//        if navigationAction.targetFrame == nil {
//            webView.load(navigationAction.request)
//        }
//
//        return nil
//    }
//
//}

