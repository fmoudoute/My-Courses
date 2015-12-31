//
//  ViewController.swift
//  How old are you
//
//  Created by Tingbo Chen on 12/30/15.
//  Copyright © 2015 Tingbo Chen. All rights reserved.
//
// This is a comment!


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!

    @IBOutlet var textField: UITextField!
    
    @IBAction func submit(sender: AnyObject) {
    
        //print("Button Tapped!")
        
        label.text = textField.text
        
    }
    
    
    //Upon Launch
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print("Hello World!")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

