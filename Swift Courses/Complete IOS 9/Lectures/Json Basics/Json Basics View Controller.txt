//
//  ViewController.swift
//  Json Basics
//
//  Created by Tingbo Chen on 1/31/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

import UIKit

/*

Note - To allow for http requests add in Info.plist:

1) Add the following:
App Transport Security Settings {Type: Dictionary}

2) Add under the App Transport Security Settings:
Allow Arbitrary Loads {Type: Boolean} {Value: Yes}

*/

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "https://freegeoip.net/json/")!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            
            if let urlContent = data {
                //print(urlContent) //for testing
                
                do {
                    let jsonResult = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers)
                    
                    print(jsonResult["city"]!!) //Print Result which is a dictionary
                    
                } catch {
                    print("JSON serialization failed")
                }
                
            }
        }
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

