//
//  BoardPrimitives.swift
//  BattleshipUber
//
//  Created by Scott Lydon on 5/12/20.
//  Copyright © 2020 Scott Lydon. All rights reserved.
//

import Foundation

extension Board {
    
    enum MoveAttempt {
        case notOnBoard, overlaps, success
    }
    
    enum Direction {
        case down, right
    }
    
    enum MissleResult {
        case hit, miss, sink, redundant
    }
}
