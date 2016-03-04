//
//  TableViewController.swift
//  Picture Zoom
//
//  Created by Tingbo Chen on 3/2/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var userProfileImages = Dictionary<String,AnyObject>()
    
    @IBAction func panButton(sender: AnyObject) {
    self.performSegueWithIdentifier("PanSegue", sender: self)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NSUserDefaults().objectForKey("userProfileImages") == nil {
            
            self.userProfileImages = ["image_0":NSData(),"image_1":NSData(),"image_2":NSData(),"image_3":NSData(),"image_4":NSData()]
            
            self.userProfileImages["image_0"] = nil
            self.userProfileImages["image_1"] = nil
            self.userProfileImages["image_2"] = nil
            self.userProfileImages["image_3"] = nil
            self.userProfileImages["image_4"] = nil
            
            NSUserDefaults.standardUserDefaults().setObject(self.userProfileImages, forKey: "userProfileImages")
            
        }
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Track User's selected row
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        if indexPath.section == 0 && indexPath.row == 0 {
            self.performSegueWithIdentifier("ImageSegue", sender: "image_0")
            
        } else if indexPath.section == 0 && indexPath.row == 1 {
            self.performSegueWithIdentifier("ImageSegue", sender: "image_1")
            
        } else if indexPath.section == 0 && indexPath.row == 2 {
            self.performSegueWithIdentifier("ImageSegue", sender: "image_2")
            
        } else if indexPath.section == 0 && indexPath.row == 3 {
            self.performSegueWithIdentifier("ImageSegue", sender: "image_3")
        
        } else if indexPath.section == 0 && indexPath.row == 4 {
            self.performSegueWithIdentifier("ImageSegue", sender: "image_4")
            
        }
        
        return indexPath
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //print("test")
        
        if segue.identifier == "ImageSegue" {
            if let UploadController = segue.destinationViewController as? UploadController {
                UploadController.currentImage_str = (sender as? String)!
                
            }
            
        }
        
        
    }

}
