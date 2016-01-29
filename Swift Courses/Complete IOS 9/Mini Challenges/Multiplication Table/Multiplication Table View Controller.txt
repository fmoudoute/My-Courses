//
//  ViewController.swift
//  Multiplication Table
//
//  Created by Tingbo Chen on 1/2/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var labelOutput: UILabel! //For testing
    
    @IBOutlet var sliderOutlet: UISlider!
    
    @IBOutlet var tableView: UITableView!
    
    @IBAction func sliderLogic(sender: AnyObject) {
        
        let currentValue = sliderOutlet.value
        
        labelOutput.text = String(Int(currentValue))

        tableView.reloadData()
        
    }

    var cellContent = [2,3,4,5,6,7,8,9]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cellContent.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //Defines the contents of each individual cell
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        let multiTableValue = Float(cellContent[indexPath.row])
        
        let sliderValue = Float(labelOutput.text!)
        
        let result = Int(multiTableValue*sliderValue!)
    
        cell.textLabel?.text = "x "+String(Int(multiTableValue))+" = "+String(result)
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

