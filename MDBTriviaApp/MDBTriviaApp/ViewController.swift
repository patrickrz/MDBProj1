//
//  ViewController.swift
//  MDBTriviaApp
//
//  Created by Patrick Zhu on 9/18/20.
//  Copyright © 2020 Patrick Zhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var StartButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    @IBAction func startSegue(_ sender: Any) {
        self.performSegue(withIdentifier: "startSegue", sender: self)
    }
}

