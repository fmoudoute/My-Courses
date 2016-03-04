//
//  ViewController.swift
//  Picture Zoom
//
//  Created by Tingbo Chen on 3/2/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func enterButton(sender: AnyObject) {
        self.performSegueWithIdentifier("EnterSegue", sender: self)
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

