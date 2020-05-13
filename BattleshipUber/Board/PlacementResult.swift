//
//  PlacementResult.swift
//  BattleshipUber
//
//  Created by Scott Lydon on 5/12/20.
//  Copyright © 2020 Scott Lydon. All rights reserved.
//

import Foundation

extension Board {
    
    enum PlacementResult {
        case free, offboard, overlap, offAndoverlap
        
        init(_ overlaps: Bool, _ offboard: Bool) {
            switch (overlaps, offboard) {
            case (true, true): self = .offAndoverlap
            case (true, false): self = .overlap
            case (false, true): self = .offboard
            case (false, false): self = .free
            }
        }
    }
}
