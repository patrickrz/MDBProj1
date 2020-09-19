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
    @IBOutlet weak var scoreTicker: UILabel!
    @IBOutlet weak var progressBar: UIView!
    
    
    //Outlet for Buttons
  
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    
    
    let memberNames = Constants.names.map({ $0 })
    var alreadyDisplayed: [Int] = []
    var currentDisplayed: String = ""
    var score: Int = 0
    var selectedAnswer: Int = 0
    var randNames: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
    }
    
    override func viewDidAppear(_ animated: Bool) {
       //make a copy of the nameList, we wil remove from this lest
       // notYetDisplayed = memberNames
    }
    
    
    @IBAction func answerPressed(_ sender: UIButton) {
        updateQuestion()
        
        
    }
        
    func updateQuestion(){
        var randNames = memberNames.map({ $0 })
        var randomIndex = Int(arc4random_uniform(UInt32(randNames.count))) //Chooses a random index from randNames
        while alreadyDisplayed.contains(randomIndex) { //Checks to see if index has already been used and if it's a duplicate, selects another randomIndex
            randomIndex = Int(arc4random_uniform(UInt32(randNames.count)))
        }
        alreadyDisplayed.append(randomIndex)
        print(alreadyDisplayed)
        
        currentDisplayed = randNames.remove(at: randomIndex)
        memberPicture.image = Constants.getImageFor(name: currentDisplayed)
        
        //Display four random names (doesn't have to be correct just yet)
        let optIndex1 = Int(arc4random_uniform(UInt32(randNames.count)))
        let optIndex2 = Int(arc4random_uniform(UInt32(randNames.count)))
        let optIndex3 = Int(arc4random_uniform(UInt32(randNames.count)))
        let optIndex4 = Int(arc4random_uniform(UInt32(randNames.count)))
        option1.setTitle(randNames[optIndex1], for: UIControl.State.normal)
        option2.setTitle(randNames[optIndex2], for: UIControl.State.normal)
        option3.setTitle(randNames[optIndex3], for: UIControl.State.normal)
        option4.setTitle(randNames[optIndex4], for: UIControl.State.normal)
        
//        //Select the index of the correct answer
//        let correctIndex = Int(arc4random_uniform(4))
//        
//        //Sets index for
//        if correctIndex == 0 {
//            option1.setTitle(currentDisplayed, for: UIControl.State.normal)
//        } else if correctIndex == 1 {
//            option2.setTitle(currentDisplayed, for: UIControl.State.normal)
//        } else if correctIndex == 2 {
//            option3.setTitle(currentDisplayed, for: UIControl.State.normal)
//        } else if correctIndex == 3 {
//            option4.setTitle(currentDisplayed, for: UIControl.State.normal)
//        }
        
    }
    
    func updateUI() {
        
    }
    
    func restartQuiz() {
        
    }
        
    }
    
    
    
    
    
//    @objc func nextButtonFunc(sender: UIButton!) {
//        if notYetDisplayed.count != 0 {
//            UIView.animate(withDuration: 0.2, animations: {
//                self.memberPicture.alpha = 0
//            }, completion: { _ in
//                UIView.animate(withDuration: 0.2, animations: {
//                    self.memberPicture.alpha = 1
//                })
//            })
//        } else {
//            print("hello")
//        }
//    }
//
//    func displayNewImg() -> UIImage {
//        //var answerOptions: [String] = []
//        var randNames = memberNames.map({ $0 })
//        let randomIndex = Int(arc4random_uniform(UInt32(randNames.count)))
//        currentDisplayed = randNames.remove(at: randomIndex)
//        return Constants.getImageFor(name: currentDisplayed)
        
        //Pick a random number between 1 and 4 to be the correct answer index
        //var correctIndex = Int(arc4random_uniform(4))

        //Choose 4 members at random from the names
      //  for n in 1...4 {

        //    answerOptions.append(memberNames[)



        


        

