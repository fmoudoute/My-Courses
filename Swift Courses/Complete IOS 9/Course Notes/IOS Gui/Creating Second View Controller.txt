//
//  TableViewController.swift
//  Advanced Segues
//
//  Created by Tingbo Chen on 1/14/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

import UIKit

/*

Creating a new View Controller:
-File>New>File…>Cocoa Touch Class>Next
-Name the file and save it.
-Click on the View in the Main Story board
-Show the identity inspector>Custom Class>Class
-Register in the Name of the file

*/

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("It worked!") //for testing
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1 //One Section
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6 //Six total rows
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        rowCounter = indexPath.row
        
        return indexPath
    }


}
