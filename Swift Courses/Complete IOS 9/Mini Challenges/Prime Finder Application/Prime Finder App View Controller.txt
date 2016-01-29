//
//  ViewController.swift
//  Prime Finder Application
//
//  Created by Tingbo Chen on 12/31/15.
//  Copyright © 2015 Tingbo Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userInput: UITextField!
    
    @IBOutlet var outputField: UILabel!

    @IBAction func isPrimeButton(sender: AnyObject) {
        
        if userInput.text == "" {
            outputField.text = "Must provide an integer > 0"
            
        } else {
            
            let userNum = Double(userInput.text!)!
            var primeChk = [Bool]()
            
            if userNum <= 0 {
                outputField.text = "Must provide an integer > 0"
            } else if userNum % 2 == 0 && userNum == 2 {
                primeChk.append(false)
                outputField.text = String(Int(userNum)) + " is prime!"
            } else if userNum % 2 == 0 && userNum != 2 {
                outputField.text = String(Int(userNum)) + " is NOT prime!"
            } else if userNum % 2 == 1 {
                for var i = 3; i <= Int(sqrt(userNum)) + 1; i += 2 {
                    //print(i)
                    if Int(userNum) % i == 0{
                        primeChk.append(false)
                    }
                }
                if primeChk.count >= 1 {
                    outputField.text = String(Int(userNum)) + " is NOT prime!"
                } else {
                    outputField.text = String(Int(userNum)) + " is prime!"
                }
            } else {
                outputField.text = "Must provide an integer > 0"
            }
            
        }

        userInput.text = ""
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

