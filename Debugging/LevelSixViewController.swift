//
//  LevelSixViewController.swift
//  Debugging
//
//  Created by Nicholas Aiwazian on 2/4/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

// Unsatisfiable VFL constraints
class LevelSixViewController: GameLevelViewController {

    @IBOutlet weak var finishLevelButton: UIButton!
    @IBOutlet weak var levelTitleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.levelTitleLabel.textColor = self.gameLevel.accentColor
        self.finishLevelButton.backgroundColor = self.gameLevel.accentColor

    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
