//
//  Unit.swift
//  Tactics
//
//  Created by Sam Gauck on 1/17/18.
//  Copyright © 2018 Sam Gauck. All rights reserved.
//

import Foundation
import Cocoa
enum Color: String {
    case Blue = "Blue"
    case Green = "Green"
    case Orange = "Orange"
    case Purple = "Purple"
    case Red = "Red"
    case Yellow = "Yellow"
    init(_ color: Character) {
        switch color {
        case "b":
            self = .Blue
        case "g":
            self = .Green
        case "o":
            self = .Orange
        case "p":
            self = .Purple
        case "r":
            self = .Red
        case "y":
            self = .Yellow
        default:
            self = .Blue
        }
    }
    func toChar() -> String {
        return String(self.rawValue.prefix(upTo: String.Index.init(encodedOffset: 1))).lowercased()
    }
}
class Unit: NSButton {
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
    func moveToHex(_ destinationHex: Hex) {
        self.x = destinationHex.x
        self.y = destinationHex.y - 45
    }
}
