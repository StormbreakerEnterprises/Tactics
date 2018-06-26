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
    var board: [[SKSpriteNode]] = [[]]
    
    override func didMove(to view: SKView) {
        // Setup
        setupBoard(x: 2, y: 2)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        if GKARC4RandomSource().nextInt(upperBound: 100) < 5 {
            board[rand(max: 1)][rand(max: 1)].run(SKAction.moveBy(x: CGFloat(rand(max: 2) - 1), y: CGFloat(rand(max: 2) - 1), duration: TimeInterval(rand(max: 10))))
        }
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
        if hayCenterCol {
            let centerCol: Int = ((cols-1)/2)+1
            if hayCenterRow {
                let centerRow: Int = ((rows-1)/2)+1
                board[centerCol][centerRow].position = CGPoint.zero
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
