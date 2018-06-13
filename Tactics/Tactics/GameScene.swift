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
        let location = event.location(in: board[0][0])
        let nodes = self.nodes(at: location)
        print(location)
        print(board[0][0].size)
        board[0][0].alpha = 0.5
        board[0][0].position = CGPoint(x: 100, y: 100)
        for node in nodes {
            print(node.name)
            let x = CGMutablePath.init()
            x.move(to: CGPoint(x: -51, y: 0))
            x.addLine(to: CGPoint(x: -20.5, y: 44))
            x.addLine(to: CGPoint(x: 20.5, y: 44))
            x.addLine(to: CGPoint(x: 51, y: 0))
            x.addLine(to: CGPoint(x: 20.5, y: -44))
            x.addLine(to: CGPoint(x: -20.5, y: -44))
            x.addLine(to: CGPoint(x: -51, y: 0))
            if (x.contains(location)) {
                print(true)
            }
        }
        print(nodes.count)
    }
}
