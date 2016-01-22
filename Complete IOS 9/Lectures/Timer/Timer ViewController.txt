//
//  ViewController.swift
//  Stopwatch
//
//  Created by Tingbo Chen on 1/1/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    
    var time = 0
    var mil_sec = 0
    var second = 0
    var minute = 0
    var hour = 0
    
    @IBOutlet var timerDisplay: UILabel!
    
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
        
        timerDisplay.text = stopwatch_str
        
        //print(stopwatch_str) //For testing
        //print(time) //For testing
        
    }
    
    @IBAction func startstopButton(sender: AnyObject) {
        if timer.valid == false {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.001, target: self, selector: Selector("timerLogic"), userInfo: nil, repeats: true)
            timer.fire()
        } else if timer.valid == true {
            timer.invalidate()
        }
    }
    
    @IBAction func resetButton(sender: AnyObject) {
        timer.invalidate()
        time = 0
        timerDisplay.text = "00:00:00"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        timer.invalidate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

