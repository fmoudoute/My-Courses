//
//  SecondViewController.swift
//  Weather App
//
//  Created by Tingbo Chen on 1/5/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let url = NSURL(string: "http://www.weather-forecast.com/locations/Washington-DC/forecasts/latest")!
    
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.loadRequest(NSURLRequest(URL: url))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

