//
//  Pixels.swift
//  BattleshipUber
//
//  Created by Scott Lydon on 5/12/20.
//  Copyright © 2020 Scott Lydon. All rights reserved.
//

import UIKit

/*
             y
    --------------------->
   |
   |
   |
   | x
   |
   |
   |
   V
 
 matrix[x][y] =
 x represents which row in your matrix is addressed.
 y represents the cell ni the row.
 */

extension Array where Element == Array<Board.Pixel> {
    
    init(_ placements: [Board.Placement],
         in rectangle: Board.Rectangle,
         attacks attackSpots: Set<Board.Coordinate>) {
        self = .init(
            rows: rectangle.height,
            columns: rectangle.width,
            element: .water
        )
        add(placements)
        hit(placements, attackSpots)
        sink(placements.sunk(by: attackSpots))
    }
    
    mutating func add(_ placements: [Board.Placement]) {
        placements.iterate { coordinate, placement in
            self[coordinate.x][coordinate.y] = .normal(placement.ship)
        }
    }
    
    mutating func hit(_ placements: [Board.Placement], _ attackSpots: Set<Board.Coordinate>) {
        placements.iterate { coordinate, placement in
            for coordinate in placement.coordinates.intersection(attackSpots) {
                self[coordinate.x][coordinate.y] = .hit(placement.ship)
            }
        }
    }
    
    mutating func sink(_ placements: [Board.Placement]) {
        placements.iterate { coordinate, placement in
            for coordinate in placement.coordinates {
                self[coordinate.x][coordinate.y] = .normal(placement.ship)
            }
        }
    }
    
    func printAll() {
        for row in self {
            print(row)
        }
    }
}
