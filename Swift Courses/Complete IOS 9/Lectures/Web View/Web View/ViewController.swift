//
//  ViewController.swift
//  Web View
//
//  Created by Tingbo Chen on 2/1/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webviewOutlet: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        //Loading webcontent into webview
        var url = NSURL(string: "https://www.ecowebhosting.co.uk")
        
        var request = NSURLRequest(URL: url!)
        
        webviewOutlet.loadRequest(request)
        */
        
        //Load HTML into webview
        var html = "<html><body><h1>My Page</h1><p>This is my web page.</p></body></html>"
        
        webviewOutlet.loadHTMLString(html, baseURL: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

