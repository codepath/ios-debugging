//
//  HomeViewController.swift
//  Debugging
//
//  Created by Nicholas Aiwazian on 2/4/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, GameLevelViewControllerDelegate, LevelCompleteViewControllerDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    let lastLevelCompletedKey = "last_level_completed"
    let userDefaults = UserDefaults.standard
    
    var currentLevel = 0

    let levels = [
        GameLevel(number: 1, viewController: LevelOneViewController(), detailedDescription: "The dreaded key-value coding compliant error!\n\nThis level shows you how to debug a key-value coding compliant error. If you can prevent the next view controller from crashing, you'll pass the level!", accentColor: HomeViewController.UIColorFromRGB(rgbValue: 0xFFCC00)),
        GameLevel(number: 2, viewController: LevelTwoViewController(), detailedDescription: "Uncaught exceptions!\n\nThis level shows you how to debug an uncaught exception. If you can fix the crash in the next view controller, you'll pass the level!", accentColor: HomeViewController.UIColorFromRGB(rgbValue: 0xFF9500)),
        GameLevel(number: 3, viewController: LevelThreeViewController(), detailedDescription: "My view doesn't respond to taps!\n\nWe'll look at how to debug view layout issues. If you can tap on the 'Click me to pass!' button, you'll pass the level!", accentColor: HomeViewController.UIColorFromRGB(rgbValue: 0xFF3B30)),
        GameLevel(number: 4, viewController: LevelFourViewController(), detailedDescription: "Where are my cells???\n\nFigure out a way to get the tableView cells to show up to advance to the next level!", accentColor: HomeViewController.UIColorFromRGB(rgbValue: 0xFF4981)),
        GameLevel(number: 5, viewController: LevelFiveViewController(), detailedDescription: "What's wrong with my cells?\n\nTake a look at all the movie items. Figure out why some of the movie descriptions are wrong to advance to the next level!", accentColor: HomeViewController.UIColorFromRGB(rgbValue: 0xC644FC)),
        GameLevel(number: 6, viewController: LevelSixViewController(), detailedDescription: "Unsatisfiable AutoLayout Constraints.\n\nFix the AutoLayout constraints to advance to the next level!", accentColor: HomeViewController.UIColorFromRGB(rgbValue: 0x5AC8FB))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets to level zero if no progress saved
        self.currentLevel = userDefaults.integer(forKey: lastLevelCompletedKey)
        if currentLevel >= levels.count {
            currentLevel = 0
        }
        
        self.detailsLabel.text = "Welcome to the Debugging Game!\n\nThis game has \(self.levels.count) levels. Each level has a bug. It is your responsibility to debug each issue and fix it to advance to the next level."
    }

    @IBAction func startGameTapped(sender: UIButton) {
        self.launchNextLevel()
    }
    
    func didFinishLevel() {
        userDefaults.set(self.currentLevel + 1, forKey: lastLevelCompletedKey)
        userDefaults.synchronize()
        
        self.launchLevelComplete()
    }

    func launchLevelComplete() {
        let completeViewController = LevelCompleteViewController()
        completeViewController.delegate = self
        completeViewController.gameLevel = levels[currentLevel]

        self.navigationController?.pushViewController(completeViewController, animated: false)
    }

    func playNextLevel() {
        if self.currentLevel == self.levels.count - 1 {
            self.launchGameComplete()
        } else {
            self.currentLevel += 1
            self.launchNextLevel()
        }
    }
    
    func launchNextLevel() {
        
        let introViewController = LevelIntroductionViewController()
        introViewController.gameLevel = levels[currentLevel]
        
        let actualViewController = levels[currentLevel].viewController as GameLevelViewController
        actualViewController.gameLevel = levels[currentLevel]
        actualViewController.delegate = self
        
        self.navigationController?.pushViewController(introViewController, animated: true)
    }
    
    func launchGameComplete() {
        let vc = GameCompleteViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }


    class func UIColorFromRGB(rgbValue: Int) -> UIColor {
        return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((rgbValue & 0x00FF00) >>  8))/255.0, blue: ((CGFloat)((rgbValue & 0x0000FF) >>  0))/255.0, alpha: 1.0)
    }
}
