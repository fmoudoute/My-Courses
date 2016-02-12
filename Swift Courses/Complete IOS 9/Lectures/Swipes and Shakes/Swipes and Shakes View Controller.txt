//
//  ViewController.swift
//  Swipes and Shakes
//
//  Created by Tingbo Chen on 1/30/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Swipe Right
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        //Swipe Left
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
    }
    
    //Shakes
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if event?.subtype == UIEventSubtype.MotionShake {
            print("Shake")
        }
    }
    
    func swiped(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizerDirection.Right:
                print("Swiped Right")
            
            case UISwipeGestureRecognizerDirection.Left:
                print("Swiped Left")
                
            default:
                break
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

