//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Tingbo Chen on 1/30/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

import UIKit
import CoreData

/*
Set up Entities

Got to:
Core_Data_Demo.xcdatamodeld > Add Entity > Change Entity Name
Add Attributes (example):
+username Type = String
+password Type = String
*/

/*
Clearing Core Data

Go to Simulator:
-Stop the App, then Home and remove the app.
Then go to Xcode:
-Product > Clean

*/

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        /*
        //Add variables to entity
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
        
        newUser.setValue("Alice", forKey: "username")
        newUser.setValue("password445", forKey: "password")
        
        do {
        try context.save()
        } catch {
        print("Error")
        }
        
        */
        
        //Retrieve saved data
        let request = NSFetchRequest(entityName: "Users")
        
        //request.predicate = NSPredicate(format: "username = %@", "Umi") //Search for particular object
        
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.executeFetchRequest(request)
            
            //print(results) //for testing
            
            if results.count > 0 {
                for object in results as! [NSManagedObject] {
                    
                    //context.deleteObject(object) //deletes username
                    
                    //object.setValue("New Name", forKey: "username") //changes username
                    
                    do {
                        try context.save()
                    } catch {
                        
                    }
                    
                    
                    if let username = object.valueForKey("username") as? String {
                        print(username)
                    }
                    
                }
            }
            
        } catch {
            print("Fetch Failed")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

