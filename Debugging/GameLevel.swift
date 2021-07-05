//
//  GameLevel.swift
//  Debugging
//
//  Created by Nicholas Aiwazian on 2/17/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class GameLevel: NSObject {
    var number: Int
    var viewController: GameLevelViewController
    var detailedDescription: String
    var accentColor: UIColor

    init(number: Int, viewController: GameLevelViewController, detailedDescription: String, accentColor: UIColor) {
        self.number = number
        self.viewController = viewController
        self.detailedDescription = detailedDescription
        self.accentColor = accentColor
    }
}
