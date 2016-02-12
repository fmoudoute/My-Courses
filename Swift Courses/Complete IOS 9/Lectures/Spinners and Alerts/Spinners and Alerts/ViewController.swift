//
//  ViewController.swift
//  Spinners and Alerts
//
//  Created by Tingbo Chen on 2/6/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func activityIndFunc(status: Int = 0) {
        
        if status == 1 {
            //Show Activity Indicator
            activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0,0, 50, 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            view.addSubview(activityIndicator)
            
            activityIndicator.startAnimating()
            //UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            
        } else if status == 0 {
            self.activityIndicator.stopAnimating()
            //UIApplication.sharedApplication().endIgnoringInteractionEvents()
        }
        
    }
    
    func alertFunc(alertMsg: [AnyObject]) {
        
        //Alerts
        let alert = UIAlertController(title: alertMsg[0] as? String, message: alertMsg[1] as? String, preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func spinnerOn(sender: AnyObject) {
        self.activityIndFunc(1)
    }
    
    @IBAction func spinnerOff(sender: AnyObject) {
        self.activityIndFunc(0)
    }

    @IBAction func alertButton(sender: AnyObject) {
        self.alertFunc(["This is a Test", "Test message"])
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    

}

