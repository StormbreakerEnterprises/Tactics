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
        map = [Location.main: [BtnOptions.Skirmish, BtnOptions.Campaign, BtnOptions.Tutorial], Location.skirmish: [BtnOptions.New, BtnOptions.Load, BtnOptions.Back], Location.campaign: [BtnOptions.New, BtnOptions.Load, BtnOptions.Back]]
        currentOptions = map[location]!
    }
    var location: Location {
        didSet {
            currentOptions = map[location]!
        }
    }
    let map: [Location:[BtnOptions]]
    var currentOptions: [BtnOptions]
}
enum Location {
    case main
    case skirmish
    case campaign
}
enum BtnOptions: String {
    case Skirmish = "Skirmish"
    case Campaign = "Campaign"
    case Tutorial = "Tutorial"
    case New = "New"
    case Load = "Load"
    case Back = "Back"
    func toLocation(button btnOption: BtnOptions, from: Location) -> Location {
        switch <#value#> {
        case <#pattern#>:
            <#code#>
        default:
            <#code#>
        }
    }
}
