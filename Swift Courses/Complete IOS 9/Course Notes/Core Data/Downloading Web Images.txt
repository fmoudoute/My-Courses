//
//  ViewController.swift
//  Downloading Web Image
//
//  Created by Tingbo Chen on 1/31/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageOutlet: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/6/6a/Johann_Sebastian_Bach.jpg")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) -> Void in
            
            if error != nil {
                print(error)
            } else {
                
                //Save Image locally
                var documentsDirectory:String?
                
                var paths: [AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
                
                if paths.count > 0 {
                    documentsDirectory = paths[0] as? String
                    
                    let savePath = documentsDirectory! + "/bach.jpg"
                    
                    NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
                    
                    //Reads the image
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        
                        self.imageOutlet.image = UIImage(named: savePath)
                    })
                }
                


            }
            
        }
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

