//
//  RandomBot.swift
//  RPS
//
//  Created by Isaac Ballas on 2019-11-29.
//  Copyright © 2019 Isaac Ballas. All rights reserved.
//

import Foundation
import  GameplayKit

protocol Bot {
    func play() -> Symbol
}

extension Bot {

}

class RandomBot: Bot {
    let randomizer = GKARC4RandomSource()
    func play() -> Symbol {
        let botSymbol = randomizer.nextInt(upperBound: 3) // or 2
        if botSymbol == 0 {
            print("RandomSymbol is rock")
            return .rock
        } else if botSymbol == 1 {
            print("Random Symbol is paper")
            return .paper
        } else {
            print("Random Symbol is scissor")
            return .scissor
        }
    }
}
// DRY
// KISS
// SOLID // complicated


class TacticalBot: Bot {
    var currentOption: Symbol?
    func play() -> Symbol {
        let newChoice: Symbol
        if currentOption == nil {
            let firstChoice = RandomBot().play()
            newChoice = firstChoice
        } else {
            let previousOption = currentOption!
            switch previousOption {
            case .paper:
                newChoice = .scissor
            case .rock:
                newChoice = .paper
            case .scissor:
                newChoice = .rock
            }
        }
        currentOption = newChoice
        return newChoice
    }
}

