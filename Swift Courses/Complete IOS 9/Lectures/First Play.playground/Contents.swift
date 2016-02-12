/*
Program check for the current condition of the
classic Tic Tac Toe Game and returns the result of the game.
*/

import UIKit
import CoreBluetooth
import XCPlayground

var newString = "testing regex in Swift"

func regexMatch(regex: String!, text: String!) -> [String] {
    
    do {
        let regex = try NSRegularExpression(pattern: regex, options: [])
        let nsString = text as NSString
        let results = regex.matchesInString(text,
            options: [], range: NSMakeRange(0, nsString.length))
        return results.map { nsString.substringWithRange($0.range)}
    } catch let error as NSError {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}

let matches = regexMatch("[a-zA-Z]+", text: newString)
matches.joinWithSeparator(" ")