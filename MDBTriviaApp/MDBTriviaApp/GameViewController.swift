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
    
    
    var memberNames = Constants.names.map({ $0 })
    var notYetDisplayed: [String]!
    var currentDisplayed: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        memberPicture.image = displayNewImg()
//        nextButton.addTarget(self, action: #selector(nextButtonFunc(sender:)), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
       //make a copy of the nameList, we wil remove from this lest
        notYetDisplayed = memberNames
    }
    
    
    @IBAction func answerPressed(_ sender: UIButton) {
 
        
        
    }
        
    func updateQuestion(){
        
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



        


        

