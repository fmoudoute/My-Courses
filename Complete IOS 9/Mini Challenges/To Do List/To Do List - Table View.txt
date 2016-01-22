//
//  FirstViewController.swift
//  To Do List - Table View
//
//  Created by Tingbo Chen on 1/4/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    var todo_ls: [AnyObject] = []
    
    func updateTodo_ls() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSUserDefaults().objectForKey("savedArray")
        
        todo_ls = []
        
        let accessSavedArray = NSUserDefaults().objectForKey("savedArray")! as! NSArray
        
        for (index, _) in accessSavedArray.enumerate() {
            todo_ls.append(accessSavedArray[index])
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return todo_ls.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = todo_ls[indexPath.row] as? String
        
        return cell
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        NSUserDefaults().objectForKey("savedArray")
        
        todo_ls = []
    
        let accessSavedArray = NSUserDefaults().objectForKey("savedArray")! as! NSArray
    
        for (index, _) in accessSavedArray.enumerate() {
            todo_ls.append(accessSavedArray[index])
        }
        
        tableView.reloadData()
    }
    
    
    //Delete Table View Row
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    //Delete Table View Row Logic
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            
            todo_ls.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            NSUserDefaults.standardUserDefaults().setObject(todo_ls, forKey: "savedArray")
            
            print(todo_ls)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

