//
//  SecondViewController.swift
//  To Do List - Add Items
//
//  Created by Tingbo Chen on 1/4/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var addItemField: UITextField!
    
    @IBOutlet var itemStatus: UILabel!
    
    var todo_ls: [AnyObject] = []

    @IBAction func submitButton(sender: AnyObject?) {
        
        if addItemField.text != "" {
            todo_ls.append(addItemField.text!)
            
            itemStatus.text = "Recently Added: " + addItemField.text!
            
            addItemField.text = nil
            
            NSUserDefaults.standardUserDefaults().setObject(todo_ls, forKey: "savedArray")
            
            print(todo_ls)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addItemField.delegate = self
        
        todo_ls = []
        
        NSUserDefaults().objectForKey("savedArray")
        
        let accessSavedArray = NSUserDefaults().objectForKey("savedArray")! as! NSArray
        
        for (index, _) in accessSavedArray.enumerate() {
            todo_ls.append(accessSavedArray[index])
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        todo_ls = []
        
        NSUserDefaults().objectForKey("savedArray")
        
        let accessSavedArray = NSUserDefaults().objectForKey("savedArray")! as! NSArray
        
        for (index, _) in accessSavedArray.enumerate() {
            todo_ls.append(accessSavedArray[index])
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //Tapping outside keyboard will close keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    //Tapping "return" will close keyboard
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        self.submitButton(nil)
        
        return true
    }


}

