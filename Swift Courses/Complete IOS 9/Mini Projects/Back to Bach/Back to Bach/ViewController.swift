//
//  ViewController.swift
//  Back to Bach
//
//  Created by Tingbo Chen on 1/29/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()

    @IBOutlet var playOutlet: UIBarButtonItem!
    
    @IBOutlet var scrubOutlet: UISlider!
    
    @IBOutlet var volumeOutlet: UISlider!
    
    func updateScrubSlider(){
        scrubOutlet.value = Float(player.currentTime/player.duration)
        
        if scrubOutlet.value == 1 || scrubOutlet.value == 0 {
            playOutlet.title = "Play"
        }
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
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateScrubSlider"), userInfo: nil, repeats: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func resetButton(sender: AnyObject) {
        player.stop()
        player.currentTime = 0
        playOutlet.title = "Play"
        
    }
    @IBAction func playButton(sender: AnyObject) {
        if player.playing == false {
            player.play()
            playOutlet.title = "Pause"
            //print(player.duration)
        } else if player.playing == true {
            player.pause()
            playOutlet.title = "Play"
            
        }

    }
    @IBAction func scrubAction(sender: AnyObject) {
        player.currentTime = Double(scrubOutlet.value) * player.duration
        
    }
    
    @IBAction func volumeAction(sender: AnyObject) {
        player.volume = volumeOutlet.value
    }
    
    
}

