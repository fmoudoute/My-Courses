//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import Parse
import FBSDKCoreKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let permission = ["public_profile"]
        
        PFFacebookUtils.logInInBackgroundWithReadPermissions(permission) { (user: PFUser?, error: NSError?) -> Void in
            
            if let error = error {
                print(error)
            } else {
                if let user = user {
                    print(user)
                }
            }
        }
        
        
        /*
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success, error) -> Void in
            print("Object has been saved.")
        }
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

