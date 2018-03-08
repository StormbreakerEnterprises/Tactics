//
//  ViewController.swift
//  Tactics
//
//  Created by Sam Gauck on 1/7/18.
//  Copyright © 2018 Sam Gauck. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.setFrameSize(NSMakeSize(1366, 768))
        btn1.title = "Skirmish"
        btn2.title = "Campaign"
        btn3.title = "Tutorial"
        //background.isHidden = true
        blueSwordsman.isHidden = true
        background.image = #imageLiteral(resourceName: "lobbyBackround")
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBOutlet weak var btn1: NSButton!
    @IBOutlet weak var btn2: NSButton!
    @IBOutlet weak var btn3: NSButton!
    @IBOutlet weak var menuButtonsView: NSStackView!
    @IBOutlet weak var background: NSImageView!
    @IBOutlet weak var blueSwordsman: NSButton!
    
    
    @IBAction func btn1Pressed(_ sender: NSButton) {
        skirmish()
    }
    @IBAction func btn2Pressed(_ sender: NSButton) {
        
    }
    @IBAction func btn3Pressed(_ sender: NSButton) {
        
    }
    @IBAction func blueSwordsmanClicked(_ sender: NSButton) {
        blueSwordsman.alphaValue = 0.60
        
        //Optional inner border for selected units
        //blueSwordsman.layer?.borderColor = CGColor(red: 116, green: 132, blue: 0, alpha: 1)
        //blueSwordsman.layer?.borderWidth = 4
        //blueSwordsman.layer?.cornerRadius = 5
    }
    func skirmish(new: Bool = true) {
        menuButtonsView.isHidden = true
        background.isHidden = false
        background.image = #imageLiteral(resourceName: "testHexBoard")
        blueSwordsman.isHidden = false
        blueSwordsman.frame.origin.y = self.view.frame.origin.y + (self.view.frame.size.height / 2) - (blueSwordsman.frame.size.height / 2) - 42.5
        blueSwordsman.frame.origin.x = self.view.frame.origin.x + (self.view.frame.size.width / 2) - (blueSwordsman.frame.size.width / 2)
        var bS2 = NSButton(image: #imageLiteral(resourceName: "blue"), target: nil, action: nil)
        self.view.addSubview(bS2)
        var b = Color.Blue
        var bb = Color("b")
        print(b.rawValue)
        print(bb.rawValue)
        print(b.toChar())
        print(bb.toChar())
    }
}

