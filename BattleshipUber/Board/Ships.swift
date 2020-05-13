//
//  Ships.swift
//  BattleshipUber
//
//  Created by Scott Lydon on 5/12/20.
//  Copyright © 2020 Scott Lydon. All rights reserved.
//

import Foundation


extension Array where Element == Ship {
    
    static func sunkenShips(_ placements: [Board.Placement], attackPoints: Set<Board.Coordinate>) -> [Ship] {
        var new: [Ship] = []
        for placement in placements {
            if placement.sinks(from: attackPoints) {
                new.append(placement.ship)
            }
        }
        return new
    }
}
