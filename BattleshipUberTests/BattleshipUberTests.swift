//
//  BattleshipUberTests.swift
//  BattleshipUberTests
//
//  Created by Scott Lydon on 5/12/20.
//  Copyright © 2020 Scott Lydon. All rights reserved.
//

import XCTest
@testable import BattleshipUber

struct Test<Input, Output> {
    var input: Input
    var output: Output
}

struct Test2<Input, Input2, Output> {
    var input: Input
    var input2: Input2
    var output: Output
}

struct Test3<Input, Input2, Input3, Output> {
    var input: Input
    var input2: Input2
    var input3: Input3
    var output: Output
}

struct Test4<Input, Input2, Input3, Input4, Output> {
    var input: Input
    var input2: Input2
    var input3: Input3
    var input4: Input4
    var output: Output
}

class BattleshipUberTests: XCTestCase {
    
    var battleshipTests: [Test2<[Board.Placement], Set<Board.Coordinate>, [Ship]>] = [
        Test2(input: [], input2: [], output: []),
        Test2(input: [], input2: [], output: []),
    ]
    
    var boardAttackTests: [Test2<Board, Board.Coordinate, Board.MissleResult>] = []
    var boardPlacementTests: [Test2<Board, Board.Placement, Board.PlacementResult>] = []
    var boardSunkenShips: [Test<Board, [Ship]>] = []
    var renderingTests: [Test<Board, Board.Pixels>] = []
    var boardPlacementResultTests: [Test2<Bool, Bool, Board.PlacementResult>] = []
    var boardCoordinateTestsDown: [Test2<Board.Coordinate, Int, Board.Coordinate>] = []
    var boardCoordinateTestsRight:  [Test2<Board.Coordinate, Int, Board.Coordinate>] = []
    var boardCoordinateTestNew:  [Test3<Board, Int, Board.Direction, Board.Coordinate>] = []
    
    // [x][y]
    var placementIterationTests: [Test<[Board.Placement], [Board.Coordinate]>] = []
    var containsRectangleTests: [Test2<Board.Rectangle, Board.Coordinate, Bool>] = [
        Test2(
            input: Board.Rectangle(width: 1, height: 1),
            input2: Board.Coordinate(x: 1, y: 1),
            output: true
        ),
        Test2(
            input: Board.Rectangle(width: 1, height: 1),
            input2: Board.Coordinate(x: 1, y: 1),
            output: true
        ),
        Test2(
            input: Board.Rectangle(width: 1, height: 1),
            input2: Board.Coordinate(x: 1, y: 1),
            output: true
        ),
        Test2(
            input: Board.Rectangle(width: 1, height: 1),
            input2: Board.Coordinate(x: 1, y: 1),
            output: true
        ), 
    ]
    var pixelsAddTests: [Test2<[Board.Pixel], [Board.Placement], [Board.Pixel]>] = []
    var hitTests: [Test3<[Board.Pixel], [Board.Placement], [Board.Coordinate], [Board.Pixel]>] = []
    var pixelPlacementsTests: [Test2<[Board.Pixel], [Board.Placement], [Board.Pixel]>] = []
    var downTests: [Test2<Board, Int, Board.Coordinate>] = []
    var rightTests: [Test2<Board, Int, Board.Coordinate>] = []
    var newTests: [Test3<Board, Int, Board.Direction, Board.Coordinate>] = []
    
    func testAll() {
        battleshipTests.forEach {
            XCTAssertEqual([Ship].sunkenShips($0.input, attackPoints: $0.input2), $0.output)
        }
        boardAttackTests.forEach {
            var o = $0
            XCTAssertEqual(o.input.attack(coordinate: o.input2), o.output)
        }
        boardPlacementTests.forEach {
            var o = $0
            XCTAssertEqual(o.input.place(o.input2), o.output)
        }
        boardSunkenShips.forEach {
            XCTAssertEqual($0.input.sunkenShips, $0.output)
        }
        renderingTests.forEach {
            XCTAssertEqual($0.input.rendering, $0.output)
        }
        containsRectangleTests.forEach {
            XCTAssertEqual($0.input.contains($0.input2), $0.output)
        }
        
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
