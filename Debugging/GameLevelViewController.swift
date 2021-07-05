//
//  ViewController.swift
//  Debugging
//
//  Created by Nicholas Aiwazian on 2/4/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

protocol GameLevelViewControllerDelegate: class {
    func didFinishLevel()
}

class GameLevelViewController: UIViewController {
    
    var gameLevel: GameLevel!
    
    weak var delegate: GameLevelViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func didFinishLevel() {
        self.delegate?.didFinishLevel()
    }
    
    @IBAction func finishLevelTapped(sender: AnyObject) {
        self.didFinishLevel()
    }
}

