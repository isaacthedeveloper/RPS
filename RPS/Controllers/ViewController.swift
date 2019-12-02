//
//  ViewController.swift
//  RPS
//
//  Created by Isaac Ballas on 2019-12-01.
//  Copyright © 2019 Isaac Ballas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var bot: Bot?
    let segueId = "showRandomBotGameController"
    // MARK: - Outlets
    @IBOutlet weak var randomBotButton:   UIButton!
    @IBOutlet weak var tacticalBotButton: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }
    // MARK: - Action
    @IBAction func randomBotSelected(_ sender: UIButton) {
        bot = RandomBot()
        performSegue(withIdentifier: segueId, sender: sender)
    }
    
    @IBAction func tacticalBotSelected(_ sender: UIButton) {
        bot = TacticalBot()
        performSegue(withIdentifier: segueId, sender: sender)
    }
    
    // MARK: - Helper Methods
    func setupButtons() {
        randomBotButton.layer.cornerRadius = 20.0
        tacticalBotButton.layer.cornerRadius = 20.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! GameController
        vc.bot = bot
    }
    
}

