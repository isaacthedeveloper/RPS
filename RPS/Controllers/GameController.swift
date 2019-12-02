//
//  RandomBotGameController.swift
//  RPS
//
//  Created by Isaac Ballas on 2019-12-28.
//  Copyright © 2019 Isaac Ballas. All rights reserved.
//

import UIKit

class GameController: UIViewController {
    var bot: Bot?
    var roundNum = 0 {
        didSet { roundNumber.text = "Round: \(roundNum)/3" }
    }
    var humanScore = 0 {
        didSet { humanScoreLabel.text = String(humanScore) }
    }
    var robotScore = 0 {
        didSet { botScoreLabel.text = String(robotScore) }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var gameStatusLabel: UILabel!
    @IBOutlet weak var roundNumber    : UILabel!
    @IBOutlet weak var robotChoice    : UILabel!
    @IBOutlet weak var rockButton     : UIButton!
    @IBOutlet weak var paperButton    : UIButton!
    @IBOutlet weak var scissorButton  : UIButton!
    @IBOutlet weak var humanScoreLabel: UILabel!
    @IBOutlet weak var botScoreLabel  : UILabel!
    @IBOutlet weak var outcomeLabel   : UILabel!
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
    
    /*
     - 2 bots: random one and tactical one
     - pass the seleted bot into this screen
     - call bot.play() instead botRandomChoice
     */
    
    // MARK: Helper Methods
    /// Plays the game with selected mode.
    /// - Parameter playerSymbol: The players chosen symbol (Rock, Paper, Scissor)
    func playGame(_ playerSymbol: Symbol) {
        guard let bot = bot else { return }
        let botSymbol = bot.play()
        // Determine the winner or loser
        let gameOutcome = playerSymbol.outcome(botChoice: botSymbol)
        update(for: gameOutcome)
        // Robot symbol
        robotChoice.text = botSymbol.rawValue
        hideButtons(button: rockButton)
        hideButtons(button: paperButton)
        hideButtons(button: scissorButton)
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
    
    /// Updates the state of the game, and UI elements.
    /// - Parameter gameState: enum describing the state of the game.
    func update(for gameState: GameState) {
        gameStatusLabel.text = gameState.rawValue
        roundNum += 1
        checkOutcome()
        switch gameState {
        case .win:
            view.backgroundColor = UIColor.systemGreen
            humanScore += 1
            outcomeLabel.text    = "YOU WIN"
            gameStatusLabel.text = "Tap anywhere to continue to the next round."
        case .lose:
            view.backgroundColor = UIColor.systemRed
            robotScore += 1
            outcomeLabel.text    = "YOU LOSE"
            gameStatusLabel.text = "Tap anywhere to continue to the next round."
        case .draw:
            view.backgroundColor = UIColor.systemYellow
            humanScore += 1
            robotScore += 1
            outcomeLabel.text    = "YOU TIED"
            gameStatusLabel.text = "Tap anywhere to continue to the next round."
        }
    }
    
    @objc func tapToContinue() {
        gameStatusLabel.text     = ""
        view.backgroundColor     = UIColor.systemBackground
        robotChoice.text         = ""
        outcomeLabel.text        = ""
        resetButtonState(button: paperButton)
        resetButtonState(button: rockButton)
        resetButtonState(button: scissorButton)
    }
    
    func resetButtonState(button: UIButton) {
        button.isEnabled    = true
        button.isHidden     = false
    }
    
    func hideButtons(button: UIButton) {
        button.isEnabled = false
        button.isHidden  = true
    }
    
    func checkOutcome() {
        let result: String
        if roundNum == 3 {
            if humanScore > robotScore {
                result = "Human wins"
            } else if humanScore < robotScore {
                result = "Robot wins"
            } else {
                result = "Draw"
            }
            endGame(result: result)
        }
    }
    
    
    func endGame(result: String) {
        let alertController = UIAlertController(title: "GAME OVER", message: result, preferredStyle: .alert)
        let alert = UIAlertAction(title: "Play Again", style: .default) { (_) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(alert)
        present(alertController, animated: true, completion: nil)
    }
}
