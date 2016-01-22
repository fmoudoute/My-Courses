//
//  ViewController.swift
//  Animations
//
//  Created by Tingbo Chen on 1/6/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var alienImage: UIImageView!
    
    var timer = NSTimer()
    
    var frameNum = 0
    
    @IBOutlet var buttonStatus: UIButton!

    @IBAction func button(sender: AnyObject) {
        
        if timer.valid == false {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
            timer.fire()
            
        } else if timer.valid == true {
            timer.invalidate()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
        
    }
    
    func doAnimation() {
        
        frameNum = (frameNum+1) % 5
        
        let frame_str = "alienFrame" + String(frameNum + 1) + ".png"
        
        //print(frame_str)
        
        alienImage.image = UIImage(named: frame_str)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    //Bringing in and out Image
    override func viewDidLayoutSubviews() {
        
        //Move image in from left:
        /*
        alienImage.center = CGPointMake(alienImage.center.x - 400, alienImage.center.y)
        */
        
        //Fade in image:
        alienImage.alpha = 0
        
        //Grows the image:
        //alienImage.frame = CGRectMake(100, 20, 0, 0)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1) { () -> Void in
            
            //Move image in from left:
            /*
            self.alienImage.center = CGPointMake(self.alienImage.center.x + 400, self.alienImage.center.y)
            */
            
            //Fade in image:
            self.alienImage.alpha = 1
            
            //Grows the image:
            //self.alienImage.frame = CGRectMake(100, 20, 100, 200)
            
        }
    }


}

