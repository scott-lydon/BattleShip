//
//  Board.swift
//  BattleShip
//
//  Created by Scott Lydon on 5/11/20.
//  Copyright © 2020 Scott Lydon. All rights reserved.
//

import Foundation

struct Board  {
    
    private var rectangle: Rectangle
    var attackSpots: Set<Coordinate> = []
    private var placements: [Placement] = []
    
    var sunkenShips: [Ship] {
        return .sunkenShips(placements, attackPoints: attackSpots)
    }
    
    typealias Pixels = Array<Array<Board.Pixel>>
    
    var rendering: Pixels {
        return Pixels(placements, in: rectangle, attacks: attackSpots)
    }
    
    init(rectangle: Rectangle) {
        self.rectangle = rectangle
    }
    
    mutating func place(_ placement: Placement) -> PlacementResult {
        return PlacementResult(
            placements.conflicts(with: placement),
            placement.isOutside(of: rectangle)
        )
    }
    
    mutating func attack(coordinate: Coordinate) -> MissleResult {
        guard attackSpots.contains(coordinate) else {
            return .redundant
        }
        attackSpots.insert(coordinate)
        guard let ship = placements.first(where: { $0.contains(coordinate) }) else {
            return .miss
        }
        return ship.sinks(from: attackSpots) ? .sink : .hit
    }
}


