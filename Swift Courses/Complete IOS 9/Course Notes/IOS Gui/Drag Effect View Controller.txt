//
//  ViewController.swift
//  Drag Effect
//
//  Created by Tingbo Chen on 2/15/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create the label
        let label = UILabel(frame: CGRectMake(self.view.bounds.width / 2 - 100, self.view.bounds.height / 2 - 50, 200, 100))
        label.text = "Drag Me"
        label.textAlignment = NSTextAlignment.Center
        self.view.addSubview(label)
        
        //Set up gesture recongnizer
        let gesture = UIPanGestureRecognizer(target: self, action: Selector("wasDragged:"))
        label.addGestureRecognizer(gesture)
        label.userInteractionEnabled = true
    }
    
    func wasDragged(gesture: UIPanGestureRecognizer){
        
        //get distance from original point
        let translation = gesture.translationInView(self.view)
        //print(translation) //for testing
        
        
        //Update Label Center
        let label = gesture.view!
        label.center = CGPoint(x: self.view.bounds.width / 2 + translation.x,
            y: self.view.bounds.height / 2 + translation.y)
        
        //Set up Rotation and Stretch
        let xFromCenter = label.center.x - self.view.bounds.width / 2
        let scale = min(100 / abs(xFromCenter), 1)
        var rotation = CGAffineTransformMakeRotation(xFromCenter / 200) //1 radian about 60 deg
        var stretch = CGAffineTransformScale(rotation, scale, scale)
        label.transform = stretch
        
        
        //Updates Label State
        if gesture.state == UIGestureRecognizerState.Ended {
            
            if label.center.x < 100 {
                print("Passed")
                
            } else if label.center.x > self.view.bounds.width - 100 {
                print("Liked")
            }
            
            //Resets label to center after drag
            label.center = CGPoint(x: self.view.bounds.width / 2,
                y: self.view.bounds.height / 2)
            rotation = CGAffineTransformMakeRotation(0)
            stretch = CGAffineTransformScale(rotation, 1, 1)
            label.transform = stretch
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

