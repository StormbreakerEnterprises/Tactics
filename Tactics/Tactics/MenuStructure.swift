//
//  MenuStructure.swift
//  Tactics
//
//  Created by Sam Gauck on 1/7/18.
//  Copyright © 2018 Sam Gauck. All rights reserved.
//

import Foundation
class MenuStructure {
    let main = ["Skirmish", "Campaign", "Tutorial"]
    let skirmish = ["New", "Load", "Back"]
    let campaign = ["New", "Load", "Back"]
    static var instance: MenuStructure = MenuStructure()
    private init() {
        location = Location.main
        map = [Location.main: [btnOptions.Skirmish, btnOptions.Campaign, btnOptions.Tutorial], Location.skirmish: [btnOptions.New, btnOptions.Load, btnOptions.Back], Location.campaign: [btnOptions.New, btnOptions.Load, btnOptions.Back]]
        currentOptions = map[location]!
    }
    var location: Location {
        didSet {
            currentOptions = map[location]!
        }
    }
    let map: [Location:[btnOptions]]
    var currentOptions: [btnOptions]
}
enum Location {
    case main
    case skirmish
    case campaign
}
enum btnOptions: String {
    case Skirmish = "Skirmish"
    case Campaign = "Campaign"
    case Tutorial = "Tutorial"
    case New = "New"
    case Load = "Load"
    case Back = "Back"
}
