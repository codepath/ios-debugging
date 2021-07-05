//
//  LevelFourViewController.swift
//  Debugging
//
//  Created by Nicholas Aiwazian on 2/4/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

// TableView with no cells
class LevelFourViewController: GameLevelViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies: [AnyObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "SimpleMovieTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "simpleMovieCell")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.loadJSON()
    }
    
    func loadJSON() {
        let filePath = Bundle.main.path(forResource: "Movies", ofType: "json")
        let fileData = NSData.init(contentsOfFile: filePath!)
        
        do {
            if let responseDictionary = try JSONSerialization.jsonObject(with: fileData! as Data,
                                                                                 options:JSONSerialization.ReadingOptions(rawValue:0)) as? [String:AnyObject] {
                    if let movies = responseDictionary["movies"] as? [AnyObject] {
                        self.movies = movies
                    }
            }
        } catch {
            print("Error parsing JSON")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let movies = movies {
            return movies.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "simpleMovieCell") as! SimpleMovieTableViewCell
        let movie = self.movies[indexPath.row] as? [String:AnyObject]
        cell.titleLabel.text = movie!["title"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        self.didFinishLevel()
    }
    
}
