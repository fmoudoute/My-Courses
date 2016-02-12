//
//  ViewController.swift
//  Guessing Game
//
//  Created by Tingbo Chen on 12/30/15.
//  Copyright © 2015 Tingbo Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var numberInput: UITextField!
    @IBOutlet var outputField: UILabel!
    
    @IBAction func submitButton(sender: AnyObject) {
        
        //let secretNum = random()%4 + 1
        let secretNum = Int(arc4random()%4 + 1)
        
        let userNum = Int(numberInput.text!)
        
        if userNum == secretNum {
            outputField.text = ("You are right. Ans: " + String(secretNum))
        } else if userNum != secretNum && (userNum<=5 && userNum>=1) {
            outputField.text = ("Wrong guess! Ans: " + String(secretNum))
        } else {
            outputField.text = ("Guess must be between 1 and 5!")
        }
        
        numberInput.text = ""
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

