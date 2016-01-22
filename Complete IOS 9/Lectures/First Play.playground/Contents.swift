/*
Program check for the current condition of the
classic Tic Tac Toe Game and returns the result of the game.
*/

import UIKit

func check_victory(board: [AnyObject]) -> String {
    
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
    
    NSSet(array: currentCondition[0])
    
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
    } else {
        finalCondition = "game not concluded"
    }
    
    return finalCondition
    
}

var board = [
    ["O", "X", "X"],
    ["X", "O", "X"],
    ["O", "", "X"]
]

print(check_victory(board)) //X's win

