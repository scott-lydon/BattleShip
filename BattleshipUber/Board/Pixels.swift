//
//  Pixels.swift
//  BattleshipUber
//
//  Created by Scott Lydon on 5/12/20.
//  Copyright © 2020 Scott Lydon. All rights reserved.
//

import Foundation

extension Array where Element == Array<Board.Pixel> {
    
    init(_ placements: [Board.Placement],
         in rectangle: Board.Rectangle,
         attacks attackSpots: Set<Board.Coordinate>) {
        self = []
        for h in 0...rectangle.height {
            self.append([])
            for _ in 0...rectangle.width {
                self[h].append(.water)
            }
        }
        add(placements)
        hit(placements, attackSpots)
        sink(placements.sunk(by: attackSpots))
    }
    
    /// Test 3
    mutating func add(_ placements: [Board.Placement]) {
        placements.iterate { coordinate, placement in
            self[coordinate.x][coordinate.y] = .normal(placement.ship)
        }
    }
    
    /// Test 4
    mutating func hit(_ placements: [Board.Placement], _ attackSpots: Set<Board.Coordinate>) {
        placements.iterate { coordinate, placement in
            for coordinate in placement.coordinates.intersection(attackSpots) {
                self[coordinate.x][coordinate.y] = .hit(placement.ship)
            }
        }
    }
    
    /// Test 5
    mutating func sink(_ placements: [Board.Placement]) {
        placements.forEach {
            let start = $0.topLeft
            for int in 0...$0.ship.length {
                switch $0.direction {
                case .down:
                    self[start.x + int][start.y] = .normal($0.ship)
                case .right:
                    self[start.x][start.y + int] = .normal($0.ship)
                }
            }
        }
    }
    
    func printAll() {
        for row in self {
            print(row)
        }
    }
}
