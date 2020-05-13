//
//  BoardCoordinate.swift
//  BattleshipUber
//
//  Created by Scott Lydon on 5/12/20.
//  Copyright © 2020 Scott Lydon. All rights reserved.
//

import Foundation

extension Board {
    
    struct Coordinate: Hashable, Equatable {
        var x: Int
        var y: Int
        
        /// Test 6
        func down(_ int: Int) -> Coordinate {
            return Coordinate(x: x + int, y: y)
        }
        
        /// Test 7 
        func right(_ int: Int) -> Coordinate {
            return Coordinate(x: x, y: y + 1)
        }
        
        func new(_ int: Int, in direction: Board.Direction) -> Coordinate {
            switch direction {
            case .down:
                return right(int)
            case .right:
                return down(int)
            }
        }
    }
}
