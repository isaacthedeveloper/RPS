//
//  GameState.swift
//  RPS
//
//  Created by Isaac Ballas on 2019-12-01.
//  Copyright © 2019 Isaac Ballas. All rights reserved.
//

import Foundation


/// Determines the state the game is in. Start -> New Game, win , lose or draw are self explanatory. 
enum GameState: String {
    case win
    case lose
    case draw
}
