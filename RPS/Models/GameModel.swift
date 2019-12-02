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


