//
//  Board.swift
//  Tactics
//
//  Created by Sam Gauck on 3/6/18.
//  Copyright © 2018 Sam Gauck. All rights reserved.
//

import Foundation
import Cocoa
class Hex: NSButton {
    var x: CGFloat {
        get {
            return self.frame.origin.x + (self.frame.size.width / 2)
        }
        set(newX) {
            self.frame.origin.x = newX - (self.frame.size.width / 2)
        }
    }
    var y: CGFloat {
        get {
            return self.frame.origin.y + (self.frame.size.height / 2)
        }
        set(newY) {
            self.frame.origin.y = newY - (self.frame.size.width / 2)
        }
    }
}
class Board {
    var board: [[Hex]] = [[]]
    init(cols x: Int, rows y: Int) {
        for col in 0..<x {
            if (col % 2 == 1) {
                for row in 0..<(y-1) {
                    board[col][row] = Hex()
                }
            } else {
                for row in 0..<y {
                    board[col][row] = Hex()
                }
            }
        }
        
    }
}
