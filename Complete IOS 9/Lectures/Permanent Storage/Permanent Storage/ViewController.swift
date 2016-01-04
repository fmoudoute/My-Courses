//
//  ViewController.swift
//  Permanent Storage
//
//  Created by Tingbo Chen on 1/3/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Saving an object
        NSUserDefaults.standardUserDefaults().setObject("Rob", forKey: "name")
        
        let userName = NSUserDefaults().objectForKey("name")! as! String // Convert back to String
        
        print(userName)
        
        //Saving an Array
        
        let num_ls = [1,2,3,4]
        
        NSUserDefaults.standardUserDefaults().setObject(num_ls, forKey: "savedArray")
        
        let returnedArray = NSUserDefaults().objectForKey("savedArray")! as! NSArray //Converting back to Array
        
        for x in returnedArray {
            print(x)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

