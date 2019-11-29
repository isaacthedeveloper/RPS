//
//  RandomBotGameController.swift
//  RPS
//
//  Created by Isaac Ballas on 2019-11-28.
//  Copyright © 2019 Isaac Ballas. All rights reserved.
//

import UIKit

class RandomBotGameController: UIViewController {
    
    var roundNum = 0 {
        didSet {
            roundNumber.text = "Round: \(roundNum)/3"
        }
    }
    
    var humanScore = 0 {
        didSet {
            humanScoreLabel.text = String(humanScore)
        }
    }
    
    var robotScore = 0 {
        didSet {
            botScoreLabel.text = String(robotScore)
        }
    }
    // MARK: - Outlets
    @IBOutlet weak var gameStatusLabel: UILabel!
    @IBOutlet weak var roundNumber: UILabel!
    @IBOutlet weak var robotIconLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorButton: UIButton!
    @IBOutlet weak var humanScoreLabel: UILabel!
    @IBOutlet weak var botScoreLabel: UILabel!
    @IBOutlet var gameView: UIView! {
        didSet {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapToContinue))
            gameView.addGestureRecognizer(tapGestureRecognizer)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundNumber.text = "Please tap rock, paper, or scissor."
    }
    
    // MARK: - Actions
    @IBAction func rockTapped(_ sender: UIButton) {
        playGame(.rock)
    }
    
    @IBAction func paperTapped(_ sender: UIButton) {
        playGame(.paper)
    }
    
    @IBAction func scissorTapped(_ sender: UIButton) {
        playGame(.scissor)
    }
    
    @IBAction func newGameTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Helper Methods
    func playGame(_ playerSymbol: Symbol) {
        let botSymbol = botRandomChoice()
        print(botSymbol)
        // Determine the winner or loser
        let gameOutcome = playerSymbol.outcome(botChoice: botSymbol)
        print("The outcome is: \(gameOutcome)")
        // update method goes here
        update(for: gameOutcome)
        // Place the robot choice image here - replace the robot icon with what they picked.
        robotIconLabel.text = botSymbol.rawValue
        // Disable and hide all buttons
        rockButton.isEnabled = false
        rockButton.isHidden = true
        paperButton.isEnabled = false
        paperButton.isHidden = true
        scissorButton.isEnabled = false
        scissorButton.isHidden = true
        // switch statement for the playerSymbol, whichever they chose, unhide it and re anable it.
        switch playerSymbol {
        case .rock:
            rockButton.isHidden = false
        case .paper:
            paperButton.isHidden = false
        case .scissor:
            scissorButton.isHidden = false
        }
    }
    
    
    func playTactical(_ playerSymbol: Symbol) {
        let botSymbol = botRandomChoice()
        print("The tactical bot chose: \(botSymbol)")
        
    }
    // Update Method
    func update(for gameState: GameState) {
        gameStatusLabel.text = gameState.rawValue
        roundNum += 1
        checkOutcome()
        switch gameState {
        case .win:
            view.backgroundColor = UIColor.systemGreen
            humanScore += 1
            gameStatusLabel.text = "Tap anywhere to continue to the next round."
        case .lose:
            view.backgroundColor = UIColor.systemRed
            robotScore += 1
            gameStatusLabel.text = "Tap anywhere to continue to the next round."
        case .draw:
            humanScore += 1
            robotScore += 1
            view.backgroundColor = UIColor.systemYellow
            gameStatusLabel.text = "Tap anywhere to continue to the next round."
        default: break
        }
    }
    
    @objc func tapToContinue() {
        gameStatusLabel.text     = ""
        view.backgroundColor     = UIColor.systemBackground
        paperButton.isEnabled    = true
        paperButton.isHidden     = false
        rockButton.isEnabled     = true
        rockButton.isHidden      = false
        scissorButton.isEnabled  = true
        scissorButton.isHidden   = false
    }
    
    func checkOutcome() {
        if roundNum == 3 {
            if humanScore > robotScore {
                print("Human wins")
            } else if humanScore < robotScore {
                print("Robot wins")
            } else if humanScore == robotScore {
                print("Draw")
            }
            endGame()
        }
    }
    
    
    func endGame() {

        let alertController = UIAlertController(title: "GAME OVER", message: "Add code here to see if player won or lost.", preferredStyle: .alert)
        let alert = UIAlertAction(title: "Play Again", style: .default) { (_) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(alert)
        present(alertController, animated: true, completion: nil)
    }
    
    
    

}
