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
    
    
    @IBAction func btn1Pressed(_ sender: NSButton) {
        
    }
    @IBAction func btn2Pressed(_ sender: NSButton) {
        
    }
    @IBAction func btn3Pressed(_ sender: NSButton) {
        
    }
}

