//
//  LevelOneViewController.swift
//  Debugging
//
//  Created by Nicholas Aiwazian on 2/4/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

// Key-value coding compliant error
class LevelOneViewController: GameLevelViewController {

    @IBOutlet weak var levelTitleLabel: UILabel!
    @IBOutlet weak var levelDescriptionLabel: UILabel!
    @IBOutlet weak var finishLevelButton2: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.levelTitleLabel.textColor = self.gameLevel.accentColor
        self.finishLevelButton2.backgroundColor = self.gameLevel.accentColor
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
