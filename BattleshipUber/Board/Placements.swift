//
//  ext-Board-Placement.swift
//  BattleShip
//
//  Created by Scott Lydon on 5/12/20.
//  Copyright © 2020 Scott Lydon. All rights reserved.
//

import Foundation

extension Array where Element == Board.Placement {
    
    func conflicts(with placement: Board.Placement) -> Bool {
        return self.contains { $0.conflicts(with: placement) }
    }
    
    func sunk(by attacks: Set<Board.Coordinate>) -> Self {
        return filter { placement in
            return placement.coordinates.allSatisfy { coordinate in
                return attacks.contains(coordinate)
            }
        }
    }
    
    typealias CoordinateAction = (Board.Coordinate, Board.Placement) -> Void
    
    /// Test 1
    func iterate(coordinateAction: CoordinateAction) {
        forEach {
            let start = $0.topLeft
            for int in 0...$0.ship.length {
                switch $0.direction {
                case .down:
                    coordinateAction(Board.Coordinate(x: start.x + int, y: start.y), $0)
                case .right:
                    coordinateAction(Board.Coordinate(x: start.x, y: start.y + int), $0)
                }
            }
        }
    }
    
    var coordinates: Set<Board.Coordinate> {
        var coords = Set<Board.Coordinate>()
        for placement in self {
            let coordinates: Set<Board.Coordinate> = placement.coordinates
            coords.inserts(coordinates)
        }
        return coords
    }
}
