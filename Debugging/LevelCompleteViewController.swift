//
//  LevelCompleteViewController.swift
//  Debugging
//
//  Created by Yili Aiwazian on 2/28/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

protocol LevelCompleteViewControllerDelegate: class {
    func playNextLevel()
}

class LevelCompleteViewController: UIViewController {
    
    weak var delegate: LevelCompleteViewControllerDelegate?
    var gameLevel: GameLevel!
   
    @IBOutlet weak var checkmarkImage: UIImageView!
    @IBOutlet weak var levelNumberLabel: UILabel!
    @IBOutlet weak var nextLevelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.levelNumberLabel.text = "Level " + String(self.gameLevel.number) + " Completed"
        self.levelNumberLabel.textColor = self.gameLevel.accentColor
        self.nextLevelButton.backgroundColor = self.gameLevel.accentColor
        self.checkmarkImage.image = checkmarkImage.image!.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        checkmarkImage.tintColor = self.gameLevel.accentColor
        self.checkmarkImage.alpha = 0
        
        UIView.animate(withDuration: 1.0, delay: 0.2, options: UIView.AnimationOptions.curveEaseInOut, animations: { () -> Void in
            self.checkmarkImage.alpha = 1
            }, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playNextLevel() {
        self.delegate?.playNextLevel()
    }
    
    @IBAction func nextLevelTapped(sender: UIButton) {
        self.playNextLevel()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
