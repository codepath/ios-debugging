//
//  LevelIntroductionViewController.swift
//  Debugging
//
//  Created by Nicholas Aiwazian on 2/9/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class LevelIntroductionViewController: UIViewController {

    var gameLevel: GameLevel!
    
    @IBOutlet weak var levelNumberLabel: UILabel!
    @IBOutlet weak var detailedDescriptionLabel: UILabel!
    @IBOutlet weak var playLevelButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.levelNumberLabel.text = "Level " + String(self.gameLevel.number)
        self.detailedDescriptionLabel.numberOfLines = 0
        self.detailedDescriptionLabel.text = self.gameLevel.detailedDescription
        self.levelNumberLabel.textColor = self.gameLevel.accentColor
        self.playLevelButton.backgroundColor = self.gameLevel.accentColor
    }
    
    @IBAction func playLevel(_ sender: Any) {
        self.navigationController?.pushViewController(self.gameLevel.viewController, animated: true)
    }


    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }


}
