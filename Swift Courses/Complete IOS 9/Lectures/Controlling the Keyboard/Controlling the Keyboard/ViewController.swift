//
//  ViewController.swift
//  Controlling the Keyboard
//
//  Created by Tingbo Chen on 1/3/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var outputLabel: UILabel!
    
    @IBOutlet var inputField: UITextField!
    
    @IBAction func submitButton(sender: AnyObject?) {
        outputLabel.text = inputField.text
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Make the delegate responsible for the text field
        self.inputField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //Tapping Outside the keyboard will close it:
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        outputLabel.text = inputField.text
        
        self.view.endEditing(true)
    }
    
    //Tapping "Return" will close the keyboard:
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        self.submitButton(nil)
        
        return true
    }

}

