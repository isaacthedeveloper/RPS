//
//  LogicTests.swift
//  RPSTests
//
//  Created by Isaac Ballas on 2019-12-01.
//  Copyright © 2019 Isaac Ballas. All rights reserved.
//

import XCTest
@testable import RPS

class LogicTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRandomBot() {
        let bot = RandomBot()
        let myChoice = Symbol.paper
        let botChoice = bot.play()
        
        switch botChoice {
        case .paper:
            let result = botChoice.outcome(botChoice: myChoice)
            XCTAssert(result == .draw, "Must be draw")
        case .rock:
            let result = botChoice.outcome(botChoice: myChoice)
            XCTAssert(result == .lose, "Must be lose")
        case .scissor:
            let result = botChoice.outcome(botChoice: myChoice)
            XCTAssert(result == .win, "Must be draw")
        }
    }
    
    func testTacticalBot() {
        let bot = TacticalBot()
        let firstRound = bot.play()
        let nextRound = bot.play()
        let result = nextRound.outcome(botChoice: firstRound)
        XCTAssert(result == .win, "Must be win")
        
        XCTAssert(result != .draw, "Not raw")
    }

}
