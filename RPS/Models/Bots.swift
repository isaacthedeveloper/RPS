//
//  RandomBot.swift
//  RPS
//
//  Created by Isaac Ballas on 2019-12-01.
//  Copyright © 2019 Isaac Ballas. All rights reserved.
//

import Foundation
import  GameplayKit

protocol Bot {
    func play() -> Symbol
}

class RandomBot: Bot {
    let randomizer = GKARC4RandomSource()
    func play() -> Symbol {
        let botSymbol = randomizer.nextInt(upperBound: 3)
        if botSymbol == 0 {
            return .rock
        } else if botSymbol == 1 {
            return .paper
        } else {
            return .scissor
        }
    }
}

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

