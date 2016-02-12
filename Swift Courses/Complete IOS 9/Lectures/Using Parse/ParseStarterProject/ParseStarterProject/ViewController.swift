//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    //Creating a Spinner
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBAction func pauseButton(sender: AnyObject) {
        activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0,0, 50, 50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        //UIApplication.sharedApplication().beginIgnoringInteractionEvents()
    }
    
    
    @IBAction func restoreButton(sender: AnyObject) {
        activityIndicator.stopAnimating()
        //UIApplication.sharedApplication().endIgnoringInteractionEvents()
    }
    
    //Adding Alerts
    @IBAction func alertButton(sender: AnyObject) {
        var alert = UIAlertController(title: "Alert!", message: "Are you sure?", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { (action) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    //Importing Image
    @IBOutlet var ImageOutlet: UIImageView!
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        print("image selected")
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        ImageOutlet.image = image
    }
    
    @IBAction func importButton(sender: AnyObject) {
        
        var image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        //image.sourceType = UIImagePickerControllerSourceType.Camera //To import from camera
        image.allowsEditing = true
        
        self.presentViewController(image, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        /*
        //Adding an Object to parse
        var product = PFObject(className: "Products")
        
        product["name"] = "Ice Creme"
        
        product["description"] = "mint chocolate"
        
        product["price"] = 3.99
        
        product.saveInBackgroundWithBlock { (success, error) -> Void in
            if success == true {
                print("successfully saved, ID: " + String(product.objectId!))
            } else {
                print(error)
            }
        }
        */
        
        /*
        //Retrieving an Object from parse and Updating
        var query = PFQuery(className: "Products")
        
        query.getObjectInBackgroundWithId("Fc5TLfOEwB") { (object: PFObject?, error: NSError?) -> Void in
            
            if error != nil {
                print(error)
            } else if let product = object {
                //print(object)
                
                //print(object!.objectForKey("description")!) //Retrieving the object
                
                //Updating the object
                product["description"] = "Rocky Road"
                product["price"] = 5.99
                product.saveInBackground()
                
            }
        
        }
        */
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

