//
//  ViewController.swift
//  Shake It Baby
//
//  Created by Tingbo Chen on 1/30/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var soundIndex = ["Barrel_Exploding", "Catapult", "Flashbang", "Loud_Bang",
    "Missle_Strike","Mortar_Round","Tick_Tock","Ticking_Clock","Winchester12"]
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    
    
    //Shakes
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if event?.subtype == UIEventSubtype.MotionShake {

            let randomNum = Int(arc4random_uniform(UInt32(soundIndex.count)))
            //print(soundIndex[randomNum])
            
            //Create a path to the mp3 player
            let audioPath = NSBundle.mainBundle().pathForResource(soundIndex[randomNum], ofType: "mp3")!
            
            do { //Insert audio path into the AV Audio Player
                try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
                player.play()
            } catch {
                print("error")
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

