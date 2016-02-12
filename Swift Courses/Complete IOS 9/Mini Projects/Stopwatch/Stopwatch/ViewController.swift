//
//  ViewController.swift
//  Stopwatch
//
//  Created by Tingbo Chen on 1/1/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

/*
Description: Stopwatch

A simple device that keeps track of time passed. User can start, stop, and reset the timer.

*/

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    
    var time = 0
    var mil_sec = 0
    var second = 0
    var minute = 0
    var hour = 0
    
    @IBOutlet var stopwatchDisplay: UILabel!
    
    func timerLogic() {
        
        time += 1
        mil_sec = (time) % 100
        second = (time / 100) % 60
        minute = (time / 6000) % 60
        hour = time / 360000
        
        var milSec_str:String = "00"
        
        if mil_sec < 10 {
            milSec_str = "0" + String(mil_sec)
        } else if mil_sec >= 10 {
            milSec_str = String(mil_sec)
        }
        
        var sec_str:String = "00"
        
        if second < 10 {
            sec_str = "0" + String(second)
        } else if second >= 10 {
            sec_str = String(second)
        }
        
        var min_str:String = "00"
        
        if minute < 10 {
            min_str = "0" + String(minute)
        } else if second >= 10 {
            min_str = String(minute)
        }
        
        let hour_str:String = String(hour)
        
        var stopwatch_str = min_str + ":" + sec_str + ":" + milSec_str
        
        if hour > 0 {
            stopwatch_str = hour_str + ":" + min_str + ":" + sec_str
        }
        
        stopwatchDisplay.text = stopwatch_str
        
        //print(stopwatch_str) //For testing
        
    }
    
    @IBOutlet var start_stopOutlet: UIButton!
    
    @IBAction func startButton(sender: AnyObject) {
        if timer.valid == false {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.001, target: self, selector: Selector("timerLogic"), userInfo: nil, repeats: true)
            timer.fire()
            start_stopOutlet.setTitle("Stop", forState: .Normal)
        } else {
            timer.invalidate()
            start_stopOutlet.setTitle("Start", forState: .Normal)
        }

    }
    
    @IBAction func resetButton(sender: AnyObject) {
        timer.invalidate()
        time = 0
        stopwatchDisplay.text = "00:00:00"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

