//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Tingbo Chen on 1/7/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var frameNum = 0
    let frame_dict = [0 : "nought.png", 1 : "cross.png"]
    let xo_dict = [0 : "O", 1 : "X"]
    var frame_str = ""
    var board = [
        ["", "", ""],
        ["", "", ""],
        ["", "", ""]
    ]
    
    @IBOutlet var resultsLabel: UILabel!
    
    func check_victory(board: [AnyObject]) -> String {
    /*
    Program check for the current condition of the classic Tic Tac Toe Game and returns the result of the game.
    */
        var currentCondition: [[AnyObject]] = [[],[],[],[],[],[],[],[]]
        let slotNum = Array(0...2)
        var inverse = 3
        var blank_count = 0
        
        //Find Combinations:
        for (index, _) in board.enumerate() {
            for i in slotNum {
                if String(board[i][index]) == "" {
                    blank_count += 1 //counting blanks
                }
                currentCondition[i].append(board[i][index]) //Horizontals
                currentCondition[i+3].append(board[index][i]) //Verticals
            }
        }
        
        for (index, _) in board.enumerate() { //Diagonals
            inverse += -1
            currentCondition[6].append(board[index][inverse])
            currentCondition[7].append(board[index][index])
        }
        
        //print(currentCondition) //For testing
        
        //Testing Victory Condition:
        var victory_ls: [AnyObject] = []
        var finalCondition = "None"
        
        for (index, _) in currentCondition.enumerate() {
            let uniqueFilter = NSSet(array: currentCondition[index]).count
            let blank_sets = NSSet(array: currentCondition[index])
            
            if uniqueFilter == 1 && blank_sets != NSSet(array: [""]){
                victory_ls.append(currentCondition[index])
            }
        }
        
        if victory_ls.count == 0 && blank_count == 0{
            finalCondition = "tie"
        } else if victory_ls.count >= 1{
            finalCondition = String(victory_ls[0][0]) + "\'s win"
            self.buttonKill()
        } else {
            finalCondition = "game not concluded"
        }
        
        //print(finalCondition) //for testing
        return finalCondition
    }
    
    func buttonKill() {
        slot1Outlet.enabled = false
        slot2Outlet.enabled = false
        slot3Outlet.enabled = false
        slot4Outlet.enabled = false
        slot5Outlet.enabled = false
        slot6Outlet.enabled = false
        slot7Outlet.enabled = false
        slot8Outlet.enabled = false
        slot9Outlet.enabled = false
    }
    
    @IBAction func newGame(sender: AnyObject) {
        board = [
            ["", "", ""],
            ["", "", ""],
            ["", "", ""]
        ]
        slot1Outlet.enabled = true
        slot2Outlet.enabled = true
        slot3Outlet.enabled = true
        slot4Outlet.enabled = true
        slot5Outlet.enabled = true
        slot6Outlet.enabled = true
        slot7Outlet.enabled = true
        slot8Outlet.enabled = true
        slot9Outlet.enabled = true
        slot1Outlet.setImage(nil, forState: .Normal)
        slot2Outlet.setImage(nil, forState: .Normal)
        slot3Outlet.setImage(nil, forState: .Normal)
        slot4Outlet.setImage(nil, forState: .Normal)
        slot5Outlet.setImage(nil, forState: .Normal)
        slot6Outlet.setImage(nil, forState: .Normal)
        slot7Outlet.setImage(nil, forState: .Normal)
        slot8Outlet.setImage(nil, forState: .Normal)
        slot9Outlet.setImage(nil, forState: .Normal)
    }
    
    @IBOutlet var slot1Outlet: UIButton!
    @IBAction func slot1Action(sender: AnyObject) {
        frameNum = (frameNum + 1) % 2
        frame_str = frame_dict[frameNum]!
        slot1Outlet.setImage(UIImage(named: frame_str), forState: .Normal)
        slot1Outlet.enabled = false
        board[0][0] = xo_dict[frameNum]!
        check_victory(board)
    }

    @IBOutlet var slot2Outlet: UIButton!
    @IBAction func slot2Action(sender: AnyObject) {
        frameNum = (frameNum + 1) % 2
        frame_str = frame_dict[frameNum]!
        slot2Outlet.setImage(UIImage(named: frame_str), forState: .Normal)
        slot2Outlet.enabled = false
        board[0][1] = xo_dict[frameNum]!
        check_victory(board)
    }
    
    @IBOutlet var slot3Outlet: UIButton!
    @IBAction func slot3Action(sender: AnyObject) {
        frameNum = (frameNum + 1) % 2
        frame_str = frame_dict[frameNum]!
        slot3Outlet.setImage(UIImage(named: frame_str), forState: .Normal)
        slot3Outlet.enabled = false
        board[0][2] = xo_dict[frameNum]!
        check_victory(board)
    }
    
    @IBOutlet var slot4Outlet: UIButton!
    @IBAction func slot4Action(sender: AnyObject) {
        frameNum = (frameNum + 1) % 2
        frame_str = frame_dict[frameNum]!
        slot4Outlet.setImage(UIImage(named: frame_str), forState: .Normal)
        slot4Outlet.enabled = false
        board[1][0] = xo_dict[frameNum]!
        check_victory(board)
    }
    
    @IBOutlet var slot5Outlet: UIButton!
    @IBAction func slot5Action(sender: AnyObject) {
        frameNum = (frameNum + 1) % 2
        frame_str = frame_dict[frameNum]!
        slot5Outlet.setImage(UIImage(named: frame_str), forState: .Normal)
        slot5Outlet.enabled = false
        board[1][1] = xo_dict[frameNum]!
        check_victory(board)
    }
    
    @IBOutlet var slot6Outlet: UIButton!
    @IBAction func slot6Action(sender: AnyObject) {
        frameNum = (frameNum + 1) % 2
        frame_str = frame_dict[frameNum]!
        slot6Outlet.setImage(UIImage(named: frame_str), forState: .Normal)
        slot6Outlet.enabled = false
        board[1][2] = xo_dict[frameNum]!
        check_victory(board)
    }
    
    @IBOutlet var slot7Outlet: UIButton!
    @IBAction func slot7Action(sender: AnyObject) {
        frameNum = (frameNum + 1) % 2
        frame_str = frame_dict[frameNum]!
        slot7Outlet.setImage(UIImage(named: frame_str), forState: .Normal)
        slot7Outlet.enabled = false
        board[2][0] = xo_dict[frameNum]!
        check_victory(board)
    }

    @IBOutlet var slot8Outlet: UIButton!
    @IBAction func slot8Action(sender: AnyObject) {
        frameNum = (frameNum + 1) % 2
        frame_str = frame_dict[frameNum]!
        slot8Outlet.setImage(UIImage(named: frame_str), forState: .Normal)
        slot8Outlet.enabled = false
        board[2][1] = xo_dict[frameNum]!
        check_victory(board)
    }
    
    @IBOutlet var slot9Outlet: UIButton!
    @IBAction func slot9Action(sender: AnyObject) {
        frameNum = (frameNum + 1) % 2
        frame_str = frame_dict[frameNum]!
        slot9Outlet.setImage(UIImage(named: frame_str), forState: .Normal)
        slot9Outlet.enabled = false
        board[2][2] = xo_dict[frameNum]!
        check_victory(board)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

