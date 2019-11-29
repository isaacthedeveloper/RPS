//
//  ViewController.swift
//  RPS
//
//  Created by Isaac Ballas on 2019-11-28.
//  Copyright © 2019 Isaac Ballas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let randomBot = "RandomBot"
    // MARK: - Outlets
    @IBOutlet weak var randomBotButton: UIButton!
    @IBOutlet weak var tacticalBotButton: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }

    // MARK: - Action
    @IBAction func randomBotSelected(_ sender: UIButton) {
        performSegue(withIdentifier: randomBot, sender: sender)
    }
    
    @IBAction func tacticalBotSelected(_ sender: UIButton) {
    }
    
    // MARK: - Helper Methods
    func setupButtons() {
        randomBotButton.layer.cornerRadius = 20.0
        tacticalBotButton.layer.cornerRadius = 20.0
    }
    
}

