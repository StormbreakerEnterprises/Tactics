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
        newGameButton.title = "New Game"
        loadGameButton.title = "Load Game"
        tutorial.title = "Tutorial"
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBOutlet weak var newGameButton: NSButton!
    @IBOutlet weak var loadGameButton: NSButton!
    @IBOutlet weak var tutorial: NSButton!
    @IBOutlet weak var menuButtonsView: NSStackView!
    
    @IBAction func tutorialPressed(_ sender: NSButton) {
        menuButtonsView.isHidden = true
        print("tutorial")
    }
    @IBAction func loadGamePressed(_ sender: NSButton) {
        menuButtonsView.isHidden = true
        print("load")
    }
    @IBAction func newGamePressed(_ sender: NSButton) {
        menuButtonsView.isHidden = true
        print("new")
    }
}

