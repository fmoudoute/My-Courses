//
//  ViewController.swift
//  Multiplication Table
//
//  Created by Tingbo Chen on 1/2/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var labelOutput: UILabel! //For testing
    
    @IBOutlet var sliderOutlet: UISlider!
    
    @IBAction func sliderLogic(sender: AnyObject) {
        
        let currentValue = sliderOutlet.value
        
        labelOutput.text = String(Int(currentValue))
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

