//
//  Question.swift
//  MDBTriviaApp
//
//  Created by Patrick Zhu on 9/19/20.
//  Copyright © 2020 Patrick Zhu. All rights reserved.
//

import Foundation

class Question {
    let memberPictureFile: String
    let optionA: String
    let optionB: String
    let optionC: String
    let optionD: String
    let correctIndex: Int
    
    init(image: String, choiceA: String, choiceB: String, choiceC: String, choiceD: String, answer: Int) {
        memberPictureFile = image
        optionA = choiceA
        optionB = choiceB
        optionC = choiceC
        optionD = choiceD
        correctIndex = answer
        
    }
    
}
