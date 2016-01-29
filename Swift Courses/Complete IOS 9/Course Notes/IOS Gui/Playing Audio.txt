//
//  ViewController.swift
//  Playing Audio
//
//  Created by Tingbo Chen on 1/26/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()

    @IBOutlet var volumeOutlet: UISlider!
    
    @IBAction func playerButton(sender: AnyObject) {
        player.play()
    }
    
    @IBAction func pauseButton(sender: AnyObject) {
        player.pause()
    }
    
    @IBAction func volumeScroll(sender: AnyObject) {
        player.volume = volumeOutlet.value
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create a path to the mp3 player
        let audioPath = NSBundle.mainBundle().pathForResource("bach-bwv924-breemer", ofType: "mp3")!
        
        do { //Insert audio path into the AV Audio Player
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
        } catch {
            print("error")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

