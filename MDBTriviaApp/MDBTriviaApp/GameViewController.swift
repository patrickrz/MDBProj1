//
//  GameViewController.swift
//  MDBTriviaApp
//
//  Created by Patrick Zhu on 9/18/20.
//  Copyright © 2020 Patrick Zhu. All rights reserved.
//

import UIKit

var correctIndex: Int = -1
var timeRemaining: Int = 5
var senderButton: UIButton?
var currentDisplayed: String = ""

class GameViewController: UIViewController {

    @IBOutlet weak var memberPicture: UIImageView!
    @IBOutlet weak var scoreTicker: UILabel!
    @IBOutlet weak var bestStreak: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var btnPauseResume: UIButton!
    @IBOutlet weak var statsButton: UIButton!
    
    
    
    //Outlet for Buttons
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    
    
    let memberNames = Constants.names.map({ $0 })
    var alreadyDisplayed: [Int] = []
    var score: Int = 0
    var selectedAnswer: Int = 0
    var randNames: [String]?
    var streak: Int = 0
    var bstStreak: Int = 0
    let totalQuestions = Constants.names.count
    var timer: Timer!
    var colorTimer: Timer!
    var colorTimeRemaining: Double = 0.5
    var isPause: Bool = false
    
    var recentCorrect: [String] = ["N/A", "N/A", "N/A"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        option1.backgroundColor = UIColor.blue
        option2.backgroundColor = UIColor.blue
        option3.backgroundColor = UIColor.blue
        option4.backgroundColor = UIColor.blue
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(decrementTimerLabel), userInfo: nil, repeats: true)
        scoreTicker.text = "Score: \(score)"
        bestStreak.text = "Best: \(streak)"
          var randNames = memberNames.map({ $0 })
          var randomIndex = Int(arc4random_uniform(UInt32(randNames.count))) //Chooses a random index from randNames
          while alreadyDisplayed.contains(randomIndex) { //Checks to see if index has already been used and if it's a duplicate, selects another randomIndex
              randomIndex = Int(arc4random_uniform(UInt32(randNames.count)))
          }
          alreadyDisplayed.append(randomIndex)
          currentDisplayed = randNames.remove(at: randomIndex)
            print(currentDisplayed)
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
          
        // Adds the correct member's name to the right index
         correctIndex = Int(arc4random_uniform(4))
          if correctIndex == 0 {
              option1.setTitle(currentDisplayed, for: UIControl.State.normal)
          } else if correctIndex == 1 {
              option2.setTitle(currentDisplayed, for: UIControl.State.normal)
          } else if correctIndex == 2 {
              option3.setTitle(currentDisplayed, for: UIControl.State.normal)
          } else if correctIndex == 3 {
              option4.setTitle(currentDisplayed, for: UIControl.State.normal)
          }
        
    }
    
    
    @IBAction func pauseResume(_ sender: UIButton) {
        if isPause == false {
            self.timer.invalidate()
            isPause = true
            option1.isUserInteractionEnabled = false
            option2.isUserInteractionEnabled = false
            option3.isUserInteractionEnabled = false
            option4.isUserInteractionEnabled = false
            btnPauseResume.setTitle("RESUME", for: UIControl.State.normal)
            option1.backgroundColor = UIColor.gray
            option2.backgroundColor = UIColor.gray
            option3.backgroundColor = UIColor.gray
            option4.backgroundColor = UIColor.gray
        } else if isPause == true {
            self.timer.fire()
            isPause = false
            option1.isUserInteractionEnabled = true
            option2.isUserInteractionEnabled = true
            option3.isUserInteractionEnabled = true
            option4.isUserInteractionEnabled = true
            option1.backgroundColor = UIColor.blue
            option2.backgroundColor = UIColor.blue
            option3.backgroundColor = UIColor.blue
            option4.backgroundColor = UIColor.blue
            btnPauseResume.setTitle("PAUSE", for: UIControl.State.normal)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(decrementTimerLabel), userInfo: nil, repeats: true)
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
   
    }
    
    @objc func decrementTimerLabel() {
        timeRemaining -= 1
        if timeRemaining == 0 {
            self.timer.invalidate()
            updateQuestion()
        }
        timerLabel.text = String(timeRemaining)
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        
        senderButton = sender
        sender.isUserInteractionEnabled = false
        let correctness = checkAnswer(buttonSelected: sender.tag, instCorrectIndex: correctIndex)
        if correctness {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
    }
    
    func checkAnswer(buttonSelected: Int, instCorrectIndex: Int) -> Bool {
        if buttonSelected == instCorrectIndex {
            score = score + 1
            streak = streak + 1
            if recentCorrect.count == 3 {
                recentCorrect.remove(at: 0)
                recentCorrect.append(currentDisplayed)
            } else {
                recentCorrect.append(currentDisplayed)
            }
            if streak > bstStreak {
                bstStreak = streak
            }
            
        } else {
            streak = 0
        }
        scoreTicker.text = "Score: \(score)"
        bestStreak.text = "Best: \(bstStreak)"
        return buttonSelected == instCorrectIndex
    }
    

        
    func updateQuestion() {
        option1.isUserInteractionEnabled = true
        option2.isUserInteractionEnabled = true
        option3.isUserInteractionEnabled = true
        option4.isUserInteractionEnabled = true
        option1.backgroundColor = UIColor.blue
        option2.backgroundColor = UIColor.blue
        option3.backgroundColor = UIColor.blue
        option4.backgroundColor = UIColor.blue
        timeRemaining = 5
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(decrementTimerLabel), userInfo: nil, repeats: true)
        var randNames = memberNames.map({ $0 })
        var randomIndex = Int(arc4random_uniform(UInt32(randNames.count))) //Chooses a random index from randNames
        while alreadyDisplayed.contains(randomIndex) { //Checks to see if index has already been used and if it's a duplicate, selects another randomIndex
            randomIndex = Int(arc4random_uniform(UInt32(randNames.count)))
        }
        alreadyDisplayed.append(randomIndex)
        currentDisplayed = randNames.remove(at: randomIndex)
        print(currentDisplayed)
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
        
      // Adds the correct member's name to the right index
        correctIndex = Int(arc4random_uniform(4)) //refers to greater correctIndex
        
        if correctIndex == 0 {
            option1.setTitle(currentDisplayed, for: UIControl.State.normal)
        } else if correctIndex == 1 {
            option2.setTitle(currentDisplayed, for: UIControl.State.normal)
        } else if correctIndex == 2 {
            option3.setTitle(currentDisplayed, for: UIControl.State.normal)
        } else if correctIndex == 3 {
            option4.setTitle(currentDisplayed, for: UIControl.State.normal)
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? ResultsViewController else { return }
        vc.longestStreak = self.bstStreak
        vc.recentCorrect = self.recentCorrect
    }
    
    
    @IBAction func statButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "seguetoStats", sender: self)
    }
    
    
    }
    

    

