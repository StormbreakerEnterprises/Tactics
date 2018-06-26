//
//  GameScene.swift
//  Tactics
//
//  Created by Sam Gauck on 5/27/18.
//  Copyright © 2018 Sam Gauck. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var units: [SKSpriteNode] = []
    //origin of board is bottom left corner
    var board: [[SKSpriteNode]] = [[]]
    
    override func didMove(to view: SKView) {
        // Setup
        setupBoard(x: 3, y: 3)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func removeUnit(_ unit: SKSpriteNode) {
        unit.removeFromParent()
        if let i = units.index(of: unit) {
            units.remove(at: i)
        }
    }
    
    func setupBoard(x cols: Int, y rows: Int) {
        for col in 0..<cols {
            board.append([])
            for row in 0..<rows {
                board[col].append(SKSpriteNode(imageNamed: "hex"))
                addChild(board[col][row])
            }
        }
        let hayCenterCol: Bool = cols % 2 != 0
        let hayCenterRow: Bool = rows % 2 != 0
        var centerCol: Int? = nil
        var centerRow: Int? = nil
        if hayCenterCol {
            centerCol = ((cols-1)/2)+1
        }
        if hayCenterRow {
            centerRow = ((rows-1)/2)+1
        }
        if hayCenterCol && hayCenterRow {
            board[centerCol!][centerRow!].position = CGPoint.zero
            
            let hNum = (board.count - 1)/2
            for hI in 0...hNum {
                let vNum = (board[centerCol!].count - 1)/2
                for vI in 0...vNum {
                    board[centerCol! + hI - 1][centerRow! + vI - 1].position = CGPoint(x: (102-25.78759)*Double(hI), y: hI%2==0 ? Double(88*vI) : Double(88*vI)-44)
                    board[centerCol! + hI - 1][centerRow! - vI - 1].position = CGPoint(x: (102-25.78759)*Double(hI), y: hI%2==0 ? Double(-88*vI) : Double(-88*vI)-44)
                }
                for vI in 0...vNum {
                    board[centerCol! - hI - 1][centerRow! + vI - 1].position = CGPoint(x: (-102+25.78759)*Double(hI),y: hI%2==0 ? Double(88*vI) : Double(88*vI)-44)
                    board[centerCol! - hI - 1][centerRow! - vI - 1].position = CGPoint(x: (-102+25.78759)*Double(hI), y: hI%2==0 ? Double(-88*vI) : Double(-88*vI)-44)
                }
            }
        } else if hayCenterRow {
            board = []
            setupBoard(x: cols + 1, y: rows)
            for hex in board[board.count - 1] {
                hex.removeFromParent()
            }
            board.remove(at: board.count - 1)
        } else /*if hayCenterCol*/ {
            board = []
            setupBoard(x: cols, y: rows + 1)
            for col in board {
                col[col.count - 1].removeFromParent()
//                col.remove(at: col.count - 1)
            }
            for i in 1...board.count {
                board[i-1].remove(at: board[i-1].count-1)
            }
        }
    }
    
    func rand(max upperBound: Int) -> Int { //max is inclusive
        return GKARC4RandomSource().nextInt(upperBound: upperBound + 1)
    }
    
    override func mouseDown(with event: NSEvent) {
        let location = event.location(in: self)
        let nodes = self.nodes(at: location)
        for node in nodes {
            let location = event.location(in: node)
            if (Hex.clickIsInHex(location: location)) {
                print(true)
            }
        }
    }
}
class Hex: SKSpriteNode {
    static func clickIsInHex(x: CGFloat, y: CGFloat) -> Bool {
        let step1 = y < 44 && x < 51 && x > -51 && y > -44
        let step2 = y < ((88/61) * x) + 73.574
        let step3 = y > ((88/61) * x) - 73.574
        let step4 = y < ((-88/61) * x) + 73.574
        let step5 = y > ((-88/61) * x) - 73.574
        return step1 && step2 && step3 && step4 && step5
    }
    static func clickIsInHex(location: CGPoint) -> Bool {
        return clickIsInHex(x: location.x, y: location.y)
    }
}
