//
//  GameModel.swift
//  RPS
//
//  Created by Isaac Ballas on 2019-11-28.
//  Copyright © 2019 Isaac Ballas. All rights reserved.
//
import Foundation
import GameplayKit

struct Game {
    var symbol: Symbol
    var state: GameState
}

enum Symbol: String {
    case rock = "👊"
    case paper = "🖐"
    case scissor = "✂️"
    
    func outcome(botChoice: Symbol) -> GameState {
        if self == botChoice {
            return .draw
        }
        switch self {
        case .rock:
            return botChoice == .scissor ? .win : .lose
        case .paper:
            return botChoice == .rock ? .win : .lose
        case .scissor:
            return botChoice == .paper ? .win : .lose
        }
    }
}
//
//
//// TODO: - REFACTOR
//func botRandomChoice() -> Symbol {
//    let botSymbol = randomizer.nextInt(upperBound: 3) // or 2
//    if botSymbol == 0 {
//        print("RandomSymbol is rock")
//        return .rock
//    } else if botSymbol == 1 {
//        print("Random Symbol is paper")
//        return .paper
//    } else {
//        print("Random Symbol is scissor")
//        return .scissor
//    }
//}

/*
 TACTICAL BOT
 func tacticalBot() {
    1. Pick a random symbol
    2. Check the symbol, and the following round the bot should use what would have beaten the previous one
 */


