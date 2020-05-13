//
//  Pixel.swift
//  BattleShip
//
//  Created by Scott Lydon on 5/12/20.
//  Copyright © 2020 Scott Lydon. All rights reserved.
//

import Foundation

extension Board {
    
    enum Pixel: Equatable {
        case partialOffBoard
        case water
        case hit(Ship)
        case sink(Ship)
        case normal(Ship)
        
        
        init(_ ship: Ship) {
            self = .normal(ship)
        }
    }
}

