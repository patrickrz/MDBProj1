//
//  ResultsViewController.swift
//  MDBTriviaApp
//
//  Created by Patrick Zhu on 9/19/20.
//  Copyright © 2020 Patrick Zhu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var longestStreakLabel: UILabel!
    @IBOutlet weak var longestStreakVal: UILabel!
    @IBOutlet weak var recentCorrectArray: UILabel!
    
    
    var longestStreak: Int!
    var recentCorrect: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        longestStreakVal.text = String(longestStreak)
        recentCorrectArray.text = recentCorrect.joined(separator: ", ")
    }
    
    @IBAction func resetCallback(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
