import UIKit

let board = ["", "", ""]

func check_victory(board: AnyObject) {
    
    //Possible Conditions:
    var possibleConditions: Set = [
        //Horizontals
        [[0,0], [1,0], [2,0]],
        [[0,1], [1,1], [2,1]],
        [[0,2], [1,2], [2,2]],
        //Verticals
        [[0,0], [0,1], [0,2]],
        [[1,0], [1,1], [1,2]],
        [[2,0], [2,1], [2,2]],
        //Diagonals
        [[0,0], [1,1], [2,2]],
        [[2,0], [1,1], [0,2]]
    ]
    
    var currentCondition = [[],[],[],[],[],[],[],[]]
    var loopCount = -1
    var slotNum = -1
    var blanks = 0
    
    var test: [AnyObject] = []
    
    //Find Combinations:
    for combinations in possibleConditions {
        for x in combinations {
            loopCount += 1
            if (loopCount)%3 == 0 {
                slotNum += 1
            }
            currentCondition[slotNum].append(board[x])
            
        }
        //letters = [board[y][x], for (x,y) in index]
        
    }
    
}


check_victory(board)
