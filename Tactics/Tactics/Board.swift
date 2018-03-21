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
    init() {
        super.init(frame: NSRect(x: 0, y: 0, width: 100, height: 100))
        image = #imageLiteral(resourceName: "hex")
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
class Board {
    var board: [[Hex]] = [[]]
    init(cols x: Int, rows y: Int) {
        board = Array(repeating: Array(repeating: Hex(), count: x), count: y)
//        for col in stride(from: 0, to: x, by: 1) {
//            if (col % 2 == 1) {
//                for row in stride(from: 0, to: y, by: 1) {
//                    board[col][row] = Hex()
//                }
//            } else {
//                for row in stride(from: 0, to: y-1, by: 1) {
//                    board[col][row] = Hex()
//                }
//            }
//        }
        
        
//        for col in 0..<x {
//            if (col % 2 == 1) {
//                for row in 0..<(y-1) {
//                    board[col][row] = Hex()
//                }
//            } else {
//                for row in 0..<(y) {
//                    board[col][row] = Hex()
//                }
//            }
//        }
    }
}
