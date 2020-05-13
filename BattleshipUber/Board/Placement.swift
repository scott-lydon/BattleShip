//
//  Placement.swift
//  BattleShip
//
//  Created by Scott Lydon on 5/12/20.
//  Copyright © 2020 Scott Lydon. All rights reserved.
//

import Foundation

extension Board {
    
    struct Placement {
        var ship: Ship
        var topLeft: Coordinate
        var direction: Direction
        
        var coordinates: Set<Board.Coordinate> {
            var coords: Set<Board.Coordinate> = []
            coords.insert(topLeft)
            for int in 1...ship.length {
                coords.insert(topLeft.new(int, in: direction))
            }
            return coords
        }
        
        func conflicts(with placement: Self) -> Bool {
            return coordinates.contains { coord in
                placement.coordinates.contains { $0 == coord }
            }
        }
        
        func sinks(from attackPoints: Set<Board.Coordinate>) -> Bool {
            return coordinates.allSatisfy { coord in
                attackPoints.contains(coord)
            }
        }
        
        func contains(_ coordinate: Board.Coordinate) -> Bool {
            return coordinates.contains { $0 == coordinate }
        }
        
        func isOutside(of rectangle: Rectangle) -> Bool {
            return !coordinates.allSatisfy { rectangle.contains($0) }
        }
    }
}
