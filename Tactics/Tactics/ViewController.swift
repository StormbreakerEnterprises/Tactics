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
        background.isHidden = true
        blueSwordsman.isHidden = true
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
        blueSwordsman.layer?.shadowOffset = CGSize(width: 25, height: 25)
        blueSwordsman.layer?.shadowColor = CGColor(red: 0, green: 255, blue: 0, alpha: 1)
        blueSwordsman.layer?.shadowOpacity = 0.5
        blueSwordsman.layer?.cornerRadius = 5
        //blueSwordsman.layer?.borderColor = CGColor(red: 0, green: 255, blue: 0, alpha: 1)
        //blueSwordsman.layer?.borderWidth = 1
    }
    func skirmish(new: Bool = true) {
        menuButtonsView.isHidden = true
        background.isHidden = false
        blueSwordsman.isHidden = false
        blueSwordsman.frame.origin.y = self.view.frame.origin.y + (self.view.frame.size.height / 2) - (blueSwordsman.frame.size.height / 2) - 42.5
        blueSwordsman.frame.origin.x = self.view.frame.origin.x + (self.view.frame.size.width / 2) - (blueSwordsman.frame.size.width / 2)
    }
}

