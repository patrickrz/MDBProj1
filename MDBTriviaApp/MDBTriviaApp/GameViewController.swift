//
//  GameViewController.swift
//  MDBTriviaApp
//
//  Created by Patrick Zhu on 9/18/20.
//  Copyright © 2020 Patrick Zhu. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var memberPicture: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    
    var memberNames = Constants.names.map({ $0 })
    var alreadyDisplayed: [String] = []
    var currentDisplayed: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memberPicture.image = displayNewImg()
        nextButton.addTarget(self, action: #selector(nextButtonFunc(sender:)), for: .touchUpInside)
    }
    
    @IBAction func nextButtonFunc(sender: UIButton!) {
        alreadyDisplayed.append(currentDisplayed)
    }
    
    func displayNewImg() -> UIImage {
        //var answerOptions: [String] = []
        let randNames = memberNames.map({ $0 })
        let randomIndex = Int(arc4random_uniform(UInt32(randNames.count)))
        currentDisplayed = randNames[randomIndex]
        return Constants.getImageFor(name: currentDisplayed)
        
        //Pick a random number between 1 and 4 to be the correct answer index
        //var correctIndex = Int(arc4random_uniform(4))

        //Choose 4 members at random from the names
      //  for n in 1...4 {

        //    answerOptions.append(memberNames[)

        }

        

    }
        

